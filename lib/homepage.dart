import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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

        title:
        const Center(
          child: Text('NITH Outpass Portal',
            style: TextStyle(

                color: Color(0xFFdff9fb),
            ),

          ) ,
        ),
      ),

      body:

      Center(
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

                children:
                <Widget>[

                 SizedBox(
                  height: heigh * 0.05, //height to 9% of screen height,
                  width: widt * 0.3,),

                  const CircleAvatar(
                    radius: 95,
                    backgroundColor: Colors.blue,
                    child:  CircleAvatar(
                     backgroundImage: AssetImage('images/NIT-Hamirpur-Logo.webp'),
                      radius: 93,

                    ),
                  ),
                   SizedBox(
                    height: heigh * 0.00008, //height to 9% of screen height,
                    width: widt * 0.03,
                  ),
                     Padding(
                    padding: const EdgeInsets.all(62.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'Welcome!',
                          textAlign: TextAlign.center,

                           style: GoogleFonts.merriweather(
                          textStyle: const TextStyle(

                            fontWeight: FontWeight.bold,
                            color: Colors.blue,

                            fontSize: 35,
                          ),
                           ),
                        ),
                      ),
                    ),
                  ),
                  /*const Image(image:
                    AssetImage(''),),*/

                   SizedBox(
                    height: heigh*0.08,
                    width: 0,
                  ),
                  UnconstrainedBox(
                    child: SizedBox(
                      height: 80,
                      width: 240,
                      child: ElevatedButton(
                        onPressed:() =>
                          Navigator.of(context).pushNamed('/mail'),

                        style:
                        ElevatedButton.styleFrom(
                          side: const BorderSide(width:5, color: Colors.blue),
                          primary: const Color(0xFF5391BF),
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(200),
                          ),
                        ),
                        child: const Text('Get Started',

                          style: TextStyle(

                            fontSize: 30,


                          ),),
                      ),
                    ),
                  ),
              const SizedBox(
                height: 50,
                width: 280,),

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
