import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
        image: AssetImage('images/wp8732522.png'),
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
        child: ListView(

          children:
          <Widget>[

           SizedBox(
            height: heigh * 0.01, //height to 9% of screen height,
            width: widt * 0.3,),

            const CircleAvatar(
              radius: 95,
              backgroundColor: Color(0xFF2e5cb8),
              child:  CircleAvatar(
               backgroundImage: AssetImage('images/main-qimg-e6996159b3fdbc3579503cfa4720c284-c.jpeg'),
                radius: 90,

              ),
            ),
             SizedBox(
              height: heigh * 0.00008, //height to 9% of screen height,
              width: widt * 0.03,
            ),
               Padding(
              padding: EdgeInsets.all(80.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'WELCOME NITians!',
                    textAlign: TextAlign.center,

                     style: GoogleFonts.macondo(
                    textStyle: const TextStyle(

                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                      fontSize: 45,
                    ),
                     ),
                  ),
                ),
              ),
            ),
            /*const Image(image:
              AssetImage(''),),*/

             SizedBox(
              height: heigh*0.00008,
              width: 0,
            ),
            UnconstrainedBox(
              child: SizedBox(
                height: 80,
                width: 280,
                child: ElevatedButton(
                  onPressed:() =>
                    Navigator.of(context).pushNamed('/login'),

                  style:
                  ElevatedButton.styleFrom(
                    side: const BorderSide(width:5, color: Color(0xFF2e5cb8)),
                    primary: const Color(0xFF3399ff),
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
        ],
        );
  }
}
