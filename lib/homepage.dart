import 'package:flutter/material.dart';
import 'login_page.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
        const Center(
          child: Text('NITH Outpass Portal',
            style: TextStyle(
            color:Colors.white,
            ),

          ) ,
        ),
      ),

      body:
      Center(
        child: ListView(


          children:
          <Widget>[
          const SizedBox(
          height: 50,
          width: 100,),
            const CircleAvatar(
             backgroundImage: AssetImage('images/20220509_175535.jpg'),
              radius: 90,
            ),
            const SizedBox(
              height: 0,
              width: 100,
            ),
            const Padding(
              padding: EdgeInsets.all(80.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'WELCOME NITIANS!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'RobotoSlab',
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            /*const Image(image:
              AssetImage(''),),*/
            const Divider(
                color: Colors.black,
            ),
            const SizedBox(
              height: 50,
              width: 100,
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: ElevatedButton(
                onPressed:(
                    ) {
                  Navigator.of(context).pushNamed('/login');
                },
                style:
                ElevatedButton.styleFrom(
                  primary: Colors.transparent,
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
