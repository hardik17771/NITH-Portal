/* stuDetail(String one,String two, String three) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Map data = {
    'one': one,
    'two': two,
    'three' : three,
  };
  dynamic jsonResponse;
   var response = await http.post(Uri.parse('https://nith-portal22.herokuapp.com/api/v1/student?search=') );
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
} */
/*Future<void> getData() async
{
  http.Response response =await http.get(Uri.parse('https://nith-portal22.herokuapp.com/api/v1/student?search=mrigesh'));
  if(response.statusCode==200)
  {
    String data=response.body;
    var deco = json.decode(data);
    var id= deco['_id'];
    String name= deco['name'];
    var roll= deco['roll'];

    print(name);

     Link(
                   uri: Uri.parse('link'),
                   builder: (context, followLink)=> ElevatedButton(
                     onPressed: () {


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
             ),

  }
}*/
import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// void main() {
//   runApp(
//     const MaterialApp(
//       home: WebViewApp(),
//     ),
//   );
// }
//
// class WebViewApp extends StatefulWidget {
//   const WebViewApp({super.key});
//
//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }
//
// class _WebViewAppState extends State<WebViewApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         title: const Center
//           (child: Text('Login Through Institute id'),),
//       ),
//       body: const WebView(
//         initialUrl: 'https:/nith-portal-11-qsje.onrender.com/google',
//         javascriptMode: JavascriptMode.unrestricted,
//         userAgent: 'random',
//       ),
//     );
//   }
// }





















