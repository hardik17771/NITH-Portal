import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

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
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children:
        <Widget>[
          const Image(image: AssetImage('images/20220509_175535.jpg'),
          width: 160,
              height: 160,
            fit: BoxFit.fill,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
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
              onPressed: () {},
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
    );
  }
  }
