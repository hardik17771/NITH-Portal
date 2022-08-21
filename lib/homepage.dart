import 'package:flutter/material.dart';
import 'login_page.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title:
        const Center(
          child: Text('NITH Outpass Portal',
            style: TextStyle(

            ),

          ) ,
        ),
      ),

      body:
      Center(
        child: ListView(


          children:
          <Widget>[

            const Image(image: AssetImage('images/20220509_175535.jpg'),
              width: 150,
              height: 150,

            ),
            const Padding(
              padding: EdgeInsets.all(80.0),
              child: Center(
                child: Text(
                  'WELCOME NITIANS!',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoSlab',
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            /*const Image(image:
              AssetImage(''),),*/
            SizedBox(
              height: 100,
              width: 300,
              child: ElevatedButton(
                onPressed:(
                    ) {
                  Navigator.of(context).pushNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),),
              ),
            ),

          ],

        ),
      ),
    );
  }
}