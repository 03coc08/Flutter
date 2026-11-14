import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

/// Đổi lỗi khi gửi request thành ApiException có câu thông báo dễ hiểu.
ApiException handleRequestError(Object error, StackTrace stack) {
  if (error is TimeoutException) {
    return ApiException('Máy chủ phản hồi quá lâu. Hãy thử lại.');
  }
  if (error is http.ClientException) {
    return ApiException('Không kết nối được tới máy chủ: ${error.message}');
  }
  debugPrint('Lỗi không xác định: $error\n$stack');
  return ApiException('Lỗi không xác định: $error');
}
