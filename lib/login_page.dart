import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

      return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/16351572_rm209-adj-20.jpg'),
                  fit: BoxFit.cover,
                ),),),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar( backgroundColor: Colors.transparent,
                title: const Center(child: Text('NITH Outpass Portal'),),),
              body: const MyStatefulWidget(),
            ),
          ]
      );

  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override

  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override

  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height;
    double widt = MediaQuery.of(context).size.width;
    signIn(String email,String pass) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      Map data = {
        'email': email,
        'password': pass,
      };

      dynamic jsonResponse;
      var response = await http.post(Uri.parse('//url') );
      if(response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        if(jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });
          sharedPreferences.setString("token", jsonResponse['token']);

        }
      }
      else {
        setState(() {
          _isLoading = false;
        });
        if (kDebugMode) {
          print(response.body);
        }
      }
    }

    return Center(
      child: SizedBox(
      height: heigh * 0.76 ,
      width: widt * 0.85 ,
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
                  child:  Text(
                    'Student Login',
                    style: GoogleFonts.merriweather( textStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 35),
                  ))),
               const Divider(
                color: Colors.white,
                height: 150,

              ),
              Center(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(30),
                    child: const Text(
                      'Login through Google   (Use Institute Email)',
                      style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.w500,

                      color: Colors.blue),
                    )),
              ),
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   child: TextFormField(
              //     controller: emailController,
              //
              //     decoration: const InputDecoration(
              //
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.white, width: 2.0),
              //       ),
              //       labelText: 'Institute Email',
              //       labelStyle: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //   child: TextFormField(
              //     obscureText: true,
              //     controller: passwordController,
              //     decoration: const InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.white, width: 2.0),
              //       ),
              //       labelText: 'Password',
              //       labelStyle: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 60,
                width: 60,
              ),

               UnconstrainedBox(
                 child: SizedBox(
                   height: 80,
                   width: 240,
                   child: ElevatedButton(
                     onPressed: () {

                       Navigator.of(context).pushNamed('/logg');
                     },

                     style:
                     ElevatedButton.styleFrom(
                       side: const BorderSide(width:3, color:Colors.blue),
                       primary:   const Color(0xFF5391BF),

                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(200),
                       ),
                     ),
                     child: const Text('Login Here',

                       style: TextStyle(
                         fontWeight: FontWeight.w500,
                         color: Colors.white,
                         fontSize: 27,


                       ),),

                   ),
                 ),
               ),

              const Divider(
                color: Colors.white,
                height: 10,
                indent: 80,
                endIndent: 80,
              ),

              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: UnconstrainedBox(
              //     child: SizedBox(
              //       height: 80,
              //       width: 240,
              //       child: ElevatedButton(
              //         onPressed:() =>
              //           Navigator.of(context).pushNamed('/form'),
              //         style:
              //         ElevatedButton.styleFrom(
              //           side: const BorderSide(width:3, color:Colors.blue),
              //           primary:  const Color(0xFF5391BF),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(200),
              //           ),
              //         ),
              //         child: const Text('Form',
              //
              //           style: TextStyle(
              //
              //             fontSize: 30,
              //
              //
              //           ),),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )),
        ),
      ),
      ),
    );
  }
}