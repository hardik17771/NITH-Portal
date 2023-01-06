import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/16351572_rm209-adj-20.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(
            child: Text('NITH Outpass Portal'),
          ),
        ),
        body: const NewWidget(),
      ),
    ]);
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height;
    double widt = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: heigh * 0.76,
        width: widt * 0.85,
        child: Card(
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white60,
          elevation: 10,
          child: SizedBox(
            height: heigh * 0.1, //height to 9% of screen height,
            width: widt * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text('Student Login',
                          style: GoogleFonts.merriweather(
                            textStyle: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 35),
                          ))),
                  const Divider(
                    color: Colors.blue,
                    indent: 50,
                    height: 150,
                    thickness: 0,
                    endIndent: 50,
                  ),
                  Center(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(30),
                        child: const Text(
                          'A verification Mail has been sent to your institute mail ID which you have entered, Please verify your login from clicking the link given there.',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        )),
                  ),

                  const Divider(
                    color: Colors.blue,
                    indent: 50,
                    height: 150,
                    thickness: 0,
                    endIndent: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
