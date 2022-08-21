import 'package:flutter/material.dart';
import 'package:nithh/login_page.dart';
import 'login_page.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const MyApp(),
        '/login': (BuildContext context) => const LoginPage(),
      }
    );
  }
}

