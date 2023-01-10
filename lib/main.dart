import 'package:flutter/material.dart';
import 'package:nithh/apicheck2.dart';
import 'package:nithh/entermail.dart';
import 'package:nithh/profile_page.dart';
import 'package:nithh/submitted.dart';
import 'package:nithh/verify.dart';
import 'Formm.dart';
import 'package:nithh/login_page.dart';
import 'formmhome.dart';
import 'login_page.dart';
import 'homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'apicheck.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const MyApp(),
        '/login': (BuildContext context) => const LoginPage(),
        '/formmarket' : (BuildContext context) => const FormPage(),
        '/formhome' : (BuildContext context) => const FormHomePage(),
        '/front': (BuildContext context) =>  ProfileScreen(),
        '/verify': (BuildContext context) => const VerifyPage(),
        '/mail': (BuildContext context) =>  const EnterMail(),
        '/final': (BuildContext context) => const SubmitPage(),
      }
    );
  }
}

