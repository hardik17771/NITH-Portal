import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NITH Outpass Portal App',
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('NITH Outpass Portal'),),),
        body: const MyStatefulWidget(),
      ),
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
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'NITH Login',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login Form',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,

                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'NITH Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            const SizedBox(
              height: 30,
              width: 60,
            ),

             Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: emailController.text == "" || passwordController.text == "" ? null : () {
                      setState(() {
                        _isLoading = true;
                      });
                      signIn(emailController.text, passwordController.text);
                    },
                    child: const Text('Login'),
                  )
              ),



          ],
        ));
  }
}