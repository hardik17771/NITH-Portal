import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nithh/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'entermail.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();

    var uniqueID = await deviceInfo.androidInfo;
    print(uniqueID.id);
    return uniqueID.id;
// unique ID on Android

  }

  @override
  Widget build(BuildContext context) {

    double widt = MediaQuery.of(context).size.width;
    double heigh = MediaQuery.of(context).size.height;
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
        Center(
          child: SizedBox(
              height: heigh * 0.9,
              width: widt * 0.89,
              child: Card(
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white60,
                elevation: 10,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: FutureBuilder(
                      future: useData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 30),
                            child: Column(
                              children: [
                                 SizedBox(
                                  height: heigh * 0.05,
                                ),
                                Text('My Profile',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.merriweather(
                                      textStyle:  TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: widt*0.1),
                                    )),
                                 SizedBox(
                                  height: heigh * 0.03,
                                ),
                                const CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'images/blank-profile-picture-973460__340.webp'),
                                    radius: 63,
                                  ),
                                ),
                                 SizedBox(
                                  height: heigh * 0.03,
                                ),
                                Container(
                                  height: heigh * 0.19,
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints viewportConstraints) {
                                      // double innerHeight = constraints.maxHeight;
                                      // double innerWidth = constraints.maxWidth;
                                      return Stack(
                                        children: [
                                          Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                children: [
                                                   SizedBox(
                                                    height: heigh * 0.03,
                                                  ),
                                                  Text(snapshot.data,
                                                      style: GoogleFonts
                                                          .merriweather(
                                                        textStyle:
                                                            TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: heigh * 0.025),
                                                      )),
                                                   SizedBox(
                                                    height: heigh * 0.02,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            'Filled',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize: heigh * 0.03,
                                                            ),
                                                          ),
                                                           Text(
                                                            '0',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      39,
                                                                      105,
                                                                      171,
                                                                      1),
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize:heigh * 0.03,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 25,
                                                          vertical: 8,
                                                        ),
                                                        child: Container(
                                                          height: 50,
                                                          width: 3,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Pending",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize: heigh * 0.03,
                                                            ),
                                                          ),
                                                           Text(
                                                            '0',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      39,
                                                                      105,
                                                                      171,
                                                                      1),
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize: heigh * 0.03,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                 SizedBox(
                                  height: heigh * 0.02,
                                ),
                                Container(
                                  height: heigh * 0.28,
                                  width: widt,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      children: [
                                         SizedBox(
                                          height: heigh * 0.025,
                                        ),
                                        Text(
                                          'Fill An Outpass',
                                          style: GoogleFonts.merriweather(
                                            textStyle:  TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600,
                                                fontSize:heigh * 0.027),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2.5,
                                        ),
                                       const  SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: UnconstrainedBox(
                                            child: SizedBox(
                                              height: heigh * 0.07,
                                              width: widt * 0.55,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  Navigator.of(context)
                                                      .pushNamed('/formmarket');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  // side: const BorderSide(
                                                  //     width: 5, color: Colors.blue),
                                                  primary:
                                                      const Color(0xFFD0D6D9),
                                                  // shape: RoundedRectangleBorder(
                                                  //   borderRadius: BorderRadius.circular(200),
                                                  // ),
                                                ),
                                                child: const Text(
                                                  'Outpass Form For Market',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color:  Color(0xFF2F2F30

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        UnconstrainedBox(
                                          child: SizedBox(
                                            height: heigh * 0.07,
                                            width: widt * 0.55,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                Navigator.of(context)
                                                    .pushNamed('/formhome');
                                              },
                                              style: ElevatedButton.styleFrom(
                                                // side: const BorderSide(
                                                //     width: 5, color: Colors.blue),
                                                primary:
                                                    const Color(0xFFD0D6D9),
                                                // shape: RoundedRectangleBorder(
                                                //   borderRadius: BorderRadius.circular(200),
                                                // ),
                                              ),
                                              child: const Text(
                                                'Outpass Form For Home',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF2F2F30

                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text(
                              "loading",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        }
                      }),

                ),
              )),
        ),
      ],
    );

  }
}
