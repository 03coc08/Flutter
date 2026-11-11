import 'dart:convert';

import 'package:flutter_application_2/services/mattermost_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  // Tạo api dùng client GIẢ: không cần server thật.
  MattermostApi apiWith(MockClientHandler handler) {
    return MattermostApi(
      baseUrl: 'http://example.test',
      client: MockClient(handler),
    );
  }

  test('đăng nhập đúng: gửi đúng request và trả về Session', () async {
    late http.Request sent;
    final api = apiWith((request) async {
      sent = request;
      return http.Response(
        jsonEncode({'id': 'user-1', 'username': 'manhnv'}),
        200,
        headers: {'token': 'abc123'},
      );
    });

    final session = await api.login('a@gmail.com', 'secret');

    expect(sent.method, 'POST');
    expect(sent.url.toString(), 'http://example.test/api/v4/users/login');
    expect(jsonDecode(sent.body), {
      'login_id': 'a@gmail.com',
      'password': 'secret',
    });
    expect(session.userId, 'user-1');
    expect(session.token, 'abc123');
  });

  test('sai mật khẩu (401) thì báo lỗi dễ hiểu', () async {
    final api = apiWith((_) async => http.Response('{}', 401));

    expect(
      () => api.login('a@gmail.com', 'wrong'),
      throwsA(
        isA<MattermostException>().having(
          (e) => e.message,
          'message',
          'Email hoặc mật khẩu không chính xác.',
        ),
      ),
    );
  });

  test('server lỗi (500) thì báo kèm mã lỗi', () async {
    final api = apiWith((_) async => http.Response('oops', 500));

    expect(
      () => api.login('a@gmail.com', 'secret'),
      throwsA(
        isA<MattermostException>().having(
          (e) => e.message,
          'message',
          contains('500'),
        ),
      ),
    );
  });

  test('mất mạng thì báo không kết nối được', () async {
    final api = apiWith((_) async => throw http.ClientException('no network'));

    expect(
      () => api.login('a@gmail.com', 'secret'),
      throwsA(
        isA<MattermostException>().having(
          (e) => e.message,
          'message',
          'Không kết nối được tới máy chủ.',
        ),
      ),
    );
  });

  test('200 nhưng thiếu header token thì báo lỗi', () async {
    final api = apiWith(
      (_) async => http.Response(jsonEncode({'id': 'user-1'}), 200),
    );

    expect(
      () => api.login('a@gmail.com', 'secret'),
      throwsA(isA<MattermostException>()),
    );
  });
}
