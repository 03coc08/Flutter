import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_exception.dart';
import 'api_error_handler.dart';
import 'api_response_handler.dart';

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
    final request = _buildRequest(method, path, body: body, query: query);

    final http.Response res;
    try {
      final streamed = await _client.send(request).timeout(timeout);
      res = await http.Response.fromStream(streamed);
    } catch (e, stack) {
      throw handleRequestError(e, stack);
    }

    if (kDebugMode) {
      debugPrint('[$method] ${request.url} → ${res.statusCode}');
    }
    return handleResponse(res, onUnauthorized: onUnauthorized);
  }

  http.Request _buildRequest(
    String method,
    String path, {
    Object? body,
    Map<String, String>? query,
  }) {
    final Uri uri;
    try {
      uri = Uri.parse(
        '$_baseUrl$path',
      ).replace(queryParameters: query?.isEmpty ?? true ? null : query);
    } on FormatException catch (e) {
      throw ApiException('Địa chỉ máy chủ không hợp lệ: ${e.message}');
    }

    final request = http.Request(method, uri)
      ..headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'ngrok-skip-browser-warning': 'true',
        if (token != null) 'Authorization': 'Bearer $token',
      });
    if (body != null) request.body = jsonEncode(body);
    return request;
  }
}
