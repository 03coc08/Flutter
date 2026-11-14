import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_exception.dart';

class ApiResponse {
  final int statusCode;
  final dynamic data;
  final Map<String, String> headers;

  ApiResponse(this.statusCode, this.data, this.headers);
}

ApiResponse handleResponse(
  http.Response res, {
  void Function()? onUnauthorized,
}) {
  final data = _decode(res.body);

  if (res.statusCode >= 200 && res.statusCode < 300) {
    return ApiResponse(res.statusCode, data, res.headers);
  }

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
    return null;
  }
}

String _errorMessage(int code, dynamic data, String rawBody) {
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
