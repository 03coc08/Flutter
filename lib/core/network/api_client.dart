import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

class ApiResponse {
  final int statusCode;
  final dynamic data;
  final Map<String, String> headers;

  ApiResponse(this.statusCode, this.data, this.headers);
}

class ApiClient {
  ApiClient({
    required String baseUrl,
    http.Client? client,
    this.timeout = const Duration(seconds: 15),
  }) : _baseUrl = baseUrl.trim().replaceAll(RegExp(r'/+$'), ''),
       _client = client ?? http.Client();

  final String _baseUrl;
  final http.Client _client;
  final Duration timeout;

  /// Token đăng nhập, tự gắn vào mọi request
  String? token;

  /// Gọi khi gặp 401 (hết phiên), ví dụ để quay về màn hình đăng nhập
  void Function()? onUnauthorized;

  Future<ApiResponse> get(String path, {Map<String, String>? query}) =>
      _send('GET', path, query: query);

  Future<ApiResponse> post(String path, {Object? body}) =>
      _send('POST', path, body: body);

  Future<ApiResponse> put(String path, {Object? body}) =>
      _send('PUT', path, body: body);

  Future<ApiResponse> delete(String path, {Object? body}) =>
      _send('DELETE', path, body: body);

  // ---------------- Xử lý chung cho mọi request ----------------

  Future<ApiResponse> _send(
    String method,
    String path, {
    Object? body,
    Map<String, String>? query,
  }) async {
    late final Uri uri;
    late final http.Response res;

    try {
      uri = Uri.parse(
        '$_baseUrl$path',
      ).replace(queryParameters: query?.isEmpty ?? true ? null : query);

      final request = http.Request(method, uri)
        ..headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'ngrok-skip-browser-warning': 'true',
          if (token != null) 'Authorization': 'Bearer $token',
        });
      if (body != null) request.body = jsonEncode(body);

      final streamed = await _client.send(request).timeout(timeout);
      res = await http.Response.fromStream(streamed);
    } on TimeoutException {
      throw ApiException('Máy chủ phản hồi quá lâu. Hãy thử lại.');
    } on FormatException catch (e) {
      throw ApiException('Địa chỉ máy chủ không hợp lệ: ${e.message}');
    } on http.ClientException catch (e) {
      throw ApiException('Không kết nối được tới máy chủ: ${e.message}');
    } catch (e, stack) {
      debugPrint('Lỗi không xác định: $e\n$stack');
      throw ApiException('Lỗi không xác định: $e');
    }

    if (kDebugMode) {
      debugPrint('[$method] $uri → ${res.statusCode}');
    }

    final data = _decode(res.body);

    // Thành công
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return ApiResponse(res.statusCode, data, res.headers);
    }

    // Thất bại
    if (res.statusCode == 401) onUnauthorized?.call();

    throw ApiException(
      _errorMessage(res.statusCode, data, res.body),
      statusCode: res.statusCode,
      data: data,
    );
  }

  dynamic _decode(String body) {
    if (body.isEmpty) return null;
    try {
      return jsonDecode(body);
    } catch (_) {
      return null; // không phải JSON (ví dụ trang HTML của ngrok)
    }
  }

  String _errorMessage(int code, dynamic data, String rawBody) {
    // Mattermost trả lỗi dạng {"message": "...", "id": "..."}
    if (data is Map && data['message'] is String) {
      return data['message'];
    }
    if (rawBody.trimLeft().startsWith('<')) {
      return 'Máy chủ trả về HTML thay vì JSON (mã $code). '
          'Kiểm tra lại BASE_URL hoặc ngrok.';
    }
    return switch (code) {
      400 => 'Yêu cầu không hợp lệ.',
      401 => 'Phiên đăng nhập hết hạn hoặc sai thông tin.',
      403 => 'Bạn không có quyền thực hiện thao tác này.',
      404 => 'Không tìm thấy tài nguyên.',
      >= 500 => 'Máy chủ đang gặp lỗi (mã $code).',
      _ => 'Có lỗi xảy ra (mã $code).',
    };
  }
}
