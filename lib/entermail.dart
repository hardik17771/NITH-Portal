import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class EnterMail extends StatefulWidget {
  const EnterMail({Key? key}) : super(key: key);

  @override
  State<EnterMail> createState() => _EnterMail();
}

class _EnterMail extends State<EnterMail> {
  TextEditingController oneController = TextEditingController();
  bool _isLoading = false;
  postData() async {
    var res1 = http.Client();
    var response = http.post(
        Uri.parse("https://nith-portal-11-qsje.onrender.com/api/v1/login"),
        body: {
          'email': oneController.text,
        });

  }
  // getData1() async {
  //   var res1 = http.Client();
  //   postData();
  //    response2 = http.post(
  //       Uri.parse("https://nith-portal-11-qsje.onrender.com/api/v1/login"),
  //       body: {
  //         'email': oneController.text,
  //       });
  //   String data=response2.
  //   var deco = json.decode(data);
  //   var id= deco["type"];
  // }

  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height;
    double widt = MediaQuery.of(context).size.width;
    return Stack(
      children: [
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
            backgroundColor: Colors.black38,
            title: const Center(
              child: Text(
                'NITH Outpass Portal',
                style: TextStyle(
                  color: Color(0xFFdff9fb),
                ),
              ),
            ),
          ),
          body: Center(
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
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: heigh * 0.05, //height to 9% of screen height,
                        width: widt * 0.3,
                      ),
                      const CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('images/NIT-Hamirpur-Logo.webp'),
                          radius: 78,
                        ),
                      ),
                      SizedBox(
                        height: heigh * 0.00008,
                        //height to 9% of screen height,
                        width: widt * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Center(
                          child: Text(
                            'Enter Institute Email ID',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweather(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*const Image(image:
                    AssetImage(''),),*/
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: oneController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            labelText: 'Enter Here',
                            labelStyle:
                                TextStyle(color: Colors.blue, fontSize: 25),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heigh * 0.08,
                        width: 0,
                      ),
                      UnconstrainedBox(
                        child: SizedBox(
                          height: heigh * 0.09,
                          width: widt * 0.5,
                          child: ElevatedButton(
                            onPressed: () {

                              // if(getData1() == "success")
                              //   {
                              //     Navigator.of(context).pushNamed('/front');
                              //   }
                              // else if(getData1()=="PENDING"){
                              postData();
                              Navigator.of(context).pushNamed('/verify');
                              },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  width: 5, color: Colors.blue),
                              primary: const Color(0xFF5391BF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                        width: 280,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
