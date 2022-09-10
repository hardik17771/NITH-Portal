import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);


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
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController fourController = TextEditingController();
  TextEditingController fiveController = TextEditingController();

  bool _isLoading = false;
  postData() async{
    var res1= http.Client();
    var response = http.post(Uri.parse("https://nith-portal22.herokuapp.com/api/v1/form"),
        body: {
        "name":oneController.text,
        "purpose":twoController.text,
        "branch":threeController.text,
        "duration":fourController.text,
        "roll":fiveController.text,
        }
    );

  }
  @override
  Widget build(BuildContext context) {



    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Student Details',
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
                  'Fill Form',
                  style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.w500,

                      color: Colors.white),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: oneController,

                decoration: const InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'INPUT 1',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(

                controller: twoController,
                decoration: const InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'INPUT 2',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(

                controller: threeController,
                decoration: const InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'INPUT 3',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(

                controller: fourController,
                decoration: const InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'INPUT 4',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(

                controller: fiveController,
                decoration: const InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'INPUT 5',
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

            Container(


              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: UnconstrainedBox(
                child: SizedBox(
                  height: 80,
                  width: 280,
                  child: ElevatedButton( onPressed:()=> postData(),

                    style:
                    ElevatedButton.styleFrom(
                      side: const BorderSide(width:3, color:Colors.white),
                      primary: const Color(0xFF1C53D1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    child: const Text('SUBMIT',

                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 30,


                      ),),

                  ),
                ),
              ),
            ),

            const Divider(
              color: Colors.white,
              height: 10,
              indent: 80,
              endIndent: 80,
            ),

          ],
        ));
  }
}