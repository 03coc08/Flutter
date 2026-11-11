import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/session.dart';

/// Lỗi khi làm việc với Mattermost. [message] là câu hiển thị cho người dùng.
class MattermostException implements Exception {
  final String message;

  MattermostException(this.message);

  @override
  String toString() => message;
}

/// Nơi DUY NHẤT trong app biết URL và JSON của Mattermost.
class MattermostApi {
  /// Ví dụ: http://localhost:8065 (không có /api/v4 ở cuối).
  final String baseUrl;

  /// Truyền client từ ngoài vào để test có thể dùng client giả.
  final http.Client client;

  MattermostApi({required this.baseUrl, http.Client? client})
    : client = client ?? http.Client();

  /// Đăng nhập. Thành công thì trả về [Session],
  /// thất bại thì ném [MattermostException].
  Future<Session> login(String email, String password) async {
    // 1. Gửi request, giống hệt request "login" trong Postman.
    final http.Response response;
    try {
      response = await client
          .post(
            Uri.parse('$baseUrl/api/v4/users/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'login_id': email, 'password': password}),
          )
          .timeout(const Duration(seconds: 15));
    } on TimeoutException {
      throw MattermostException('Máy chủ phản hồi quá lâu. Hãy thử lại.');
    } on http.ClientException {
      throw MattermostException('Không kết nối được tới máy chủ.');
    }

    // 2. Kiểm tra mã trạng thái.
    if (response.statusCode == 401) {
      throw MattermostException('Email hoặc mật khẩu không chính xác.');
    }
    if (response.statusCode != 200) {
      throw MattermostException(
        'Đăng nhập thất bại (mã ${response.statusCode}).',
      );
    }

    // 3. Token nằm ở HEADER, không nằm trong body.
    //    Gói http đổi tên header về chữ thường nên dùng 'token'.
    final token = response.headers['token'];
    if (token == null || token.isEmpty) {
      throw MattermostException('Máy chủ không trả về token.');
    }

    // 4. Body là JSON thông tin user, ta chỉ cần id.
    final user = jsonDecode(response.body) as Map<String, dynamic>;
    return Session(userId: user['id'] as String, token: token);
  }
}
