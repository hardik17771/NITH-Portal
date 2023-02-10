import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'entermail.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class FormPage extends StatefulWidget {

  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {


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
            appBar: AppBar( backgroundColor: Colors.black38,
              title: const Center(child: Text('NITH Outpass Portal'),),),
            body: const MyStatefulWidget(),
          ),
        ]
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  // useData() async {
  //   var res1 = http.Client();
  //   var response = await http.post(
  //       Uri.parse("https://nith-portal-11-qsje.onrender.com/api/v1/login"),
  //       body: {
  //         'email': oneController.text,
  //       });
  //   var decode = json.decode(response.body.toString());
  //   var name = decode["data"][0]["name"];
  //   return name;
  // }
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController fourController = TextEditingController();
  TextEditingController fiveController = TextEditingController();
  TextEditingController sixController = TextEditingController();
  TextEditingController sevenController = TextEditingController();
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;


  useData() async {
    var res1 = http.Client();
    var response = await http.post(
        Uri.parse("https://nith-portal-11-qsje.onrender.com/api/v1/login"),
        body: {
          'email': oneController.text,
        });
    var decode = json.decode(response.body.toString());
    var name = decode["data"][0]["name"];

    return name;
  }

  bool _isLoading = false;
  Future<String> useeData() async {
    var res1 = http.Client();
    var response = await http.post(
        Uri.parse("https://nith-portal-11-qsje.onrender.com/api/v1/login"),
        body: {
          'email': oneController.text,
        });
    var decode = json.decode(response.body.toString());
    var id = decode["data"][0]["_id"];

    return id;
  }
  posttData() async{
    print(await useeData());
    var res3= http.Client();
    var response3 = http.post(Uri.parse("https://nith-portal-11-qsje.onrender.com/api/v1/form/${await useeData()}"),
        body: {
        "Name":useData(),
        "Department":threeController.text,
        "roll":twoController.text,
        "RoomNum":fourController.text,
        "phone":fiveController.text,
          "address":sixController.text,
          "description":sevenController.text,

        }
    );

  }
  @override
  Widget build(BuildContext context) {


    double heigh = MediaQuery.of(context).size.height;
    double widt = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: useData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
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
            child: Center(
              child: ListView(
                children: <Widget>[
                  CreditCardWidget(
                    cardType: CardType.mastercard,
                    isHolderNameVisible: true,
                    isChipVisible: true,
                      cardNumber:cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: firstController.text,
                      cvvCode: cvvCode,
                      bankName: 'Outpass Fill',
                      showBackView: false,
                    onCreditCardWidgetChange: (creditCardBrand ) {  },
                  ),


                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text(

                        'Enter Details',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.merriweather(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 35,
                          ),
                        ),),
                  ),
                  const Divider(
                    color: Colors.blue,
                    height: 10,
                    indent: 80,
                    endIndent: 80,
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(30),
                      child:  Text(
                        'Fill Form',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.merriweather(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 25,
                          ),
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(

                      (snapshot.data),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.merriweather(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(

                      controller: twoController,
                      decoration: const InputDecoration(

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: 'Roll',
                        labelStyle: TextStyle(
                          color: Colors.black,
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
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: 'Department',
                        labelStyle: TextStyle(
                          color: Colors.black,
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
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: 'Room Number',
                        labelStyle: TextStyle(
                          color: Colors.black,
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
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(

                      controller: sixController,
                      decoration: const InputDecoration(

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: 'Address',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(

                      controller: sevenController,
                      decoration: const InputDecoration(

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: 'Description About Outing',
                        labelStyle: TextStyle(
                          color: Colors.black,
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
                        height: 70,
                        width: 200,
                        child: ElevatedButton( onPressed:()=>
                        { posttData(),
                          Navigator.of(context).pushNamed('/final'),},
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
                  ),

                  const Divider(
                    color: Colors.white,
                    height: 10,
                    indent: 80,
                    endIndent: 80,
                  ),

                ],
              ),
            ),
          ),
                ),
        );

    }
        else
          {
          return const Center(
          child: Text(
          "loading",
          style: TextStyle(
          fontSize: 20,
          ),
          ),
          );
          }
          });



  }
  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}