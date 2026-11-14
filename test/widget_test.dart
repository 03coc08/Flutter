import 'package:flutter/material.dart';
import 'package:messenger_app/screens/chat_detail_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
