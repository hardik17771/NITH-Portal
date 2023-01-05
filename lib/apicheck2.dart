import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: NowWebViewApp(),
    ),
  );
}

class NowWebViewApp extends StatefulWidget {
  const NowWebViewApp({super.key});

  @override
  State<NowWebViewApp> createState() => _NowWebViewAppState();
}

class _NowWebViewAppState extends State<NowWebViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center
          (child: Text('Login Through Institute id'),),
      ),
      body: const WebView(
        initialUrl: 'https://nith-portal-11-qsje.onrender.com/api/v1/login',
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'random',
      ),
    );
  }
}