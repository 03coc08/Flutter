import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messenger_app/core/config/env.dart';
import 'package:messenger_app/screens/login_page.dart';
import 'package:messenger_app/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Env.validate(); // báo lỗi sớm nếu quên truyền file env

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LoginPage(),
    );
  }
}
