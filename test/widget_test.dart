import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/screen/chat_detail_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> login(WidgetTester tester) async {
    await tester.enterText(
      find.byKey(const Key('emailField')),
      'admin@gmail.com',
    );
    await tester.enterText(find.byKey(const Key('passwordField')), '123456');
    await tester.ensureVisible(find.byKey(const Key('loginButton')));
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
  }

  testWidgets('fixed account logs in and opens Messenger', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Log In'), findsOneWidget);

    await login(tester);

    expect(find.byKey(const Key('messengerScreen')), findsOneWidget);
    expect(find.text('Chats'), findsWidgets);
    expect(find.text('Martin'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('wrong fixed account shows an error', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(
      find.byKey(const Key('emailField')),
      'wrong@gmail.com',
    );
    await tester.enterText(
      find.byKey(const Key('passwordField')),
      'wrong-password',
    );
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();

    expect(find.text('Email hoặc mật khẩu không chính xác.'), findsOneWidget);
    expect(find.text('Log In'), findsOneWidget);
  });

  testWidgets('chat list opens a conversation', (tester) async {
    await tester.pumpWidget(const MyApp());
    await login(tester);

    await tester.tap(find.text('Martin'));
    await tester.pumpAndSettle();

    expect(find.text('How are you doing?'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('bottom navigation switches to people', (tester) async {
    await tester.pumpWidget(const MyApp());
    await login(tester);

    await tester.tap(find.text('People'));
    await tester.pumpAndSettle();

    expect(find.text('Your story'), findsOneWidget);
    expect(find.text('Neymar Jr.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('chat detail fits a compact phone screen', (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: ChatDetailScreen(
          name: 'Martin',
          avatar: 'assets/images/avatar.png',
          isOnline: true,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Message'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
