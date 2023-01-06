import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: NowWebViewApp(),
//     ),
//   );
// }

class NowWebViewApp extends StatefulWidget {
  const NowWebViewApp({super.key});

  @override
  State<NowWebViewApp> createState() => _NowWebViewAppState();
}

class _NowWebViewAppState extends State<NowWebViewApp> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest:
      URLRequest(url: Uri.parse(
          "https://nith-portal-11-qsje.onrender.com/api/v1/login")),


    );


  }


}