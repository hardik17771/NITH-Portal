import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

      return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/wp8732522.png'),
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

    /*signIn(String email,String pass) async {
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
    }*/

    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Student Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 35),
                )),
            const Divider(
              color: Colors.white,
              height: 10,
              indent: 80,
              endIndent: 80,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: const Text(
                  'Login Form',
                  style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.w500,

                  color: Colors.white),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,

                decoration: const InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'Institute Email',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
              width: 60,
            ),

             UnconstrainedBox(
               child: SizedBox(
                 height: 80,
                 width: 280,
                 child: ElevatedButton(
                   onPressed: () {

                     Navigator.of(context).pushNamed('/logg');
                   },

                   style:
                   ElevatedButton.styleFrom(
                     side: const BorderSide(width:3, color:Color(0xFF2e5cb8)),
                     primary: const Color(0xFF2e5cb8),
                     onPrimary: const Color(0xFF2e5cb8),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(200),
                     ),
                   ),
                   child: const Text('LOGIN',

                     style: TextStyle(
                       fontWeight: FontWeight.w500,
                       color: Colors.white,
                       fontSize: 30,


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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: UnconstrainedBox(
                child: SizedBox(
                  height: 80,
                  width: 280,
                  child: ElevatedButton(
                    onPressed:() =>
                      Navigator.of(context).pushNamed('/form'),
                    style:
                    ElevatedButton.styleFrom(
                      side: const BorderSide(width:3, color:Colors.white),
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    child: const Text('Form',

                      style: TextStyle(

                        fontSize: 30,


                      ),),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}