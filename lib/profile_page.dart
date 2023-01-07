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
              height: heigh * 0.85,
              width: widt * 0.85,
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
                                  height: 20,
                                ),
                                Text('My Profile',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.merriweather(
                                      textStyle: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 35),
                                    )),
                                SizedBox(
                                  height: 22,
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
                                  height: 20,
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
                                                    height: 25,
                                                  ),
                                                  Text(snapshot.data,
                                                      style: GoogleFonts
                                                          .merriweather(
                                                        textStyle:
                                                            const TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 26),
                                                      )),
                                                  SizedBox(
                                                    height: 15,
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
                                                              fontSize: 25,
                                                            ),
                                                          ),
                                                          Text(
                                                            '10',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      39,
                                                                      105,
                                                                      171,
                                                                      1),
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize: 25,
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
                                                              fontSize: 25,
                                                            ),
                                                          ),
                                                          Text(
                                                            '1',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      39,
                                                                      105,
                                                                      171,
                                                                      1),
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize: 25,
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
                                  height: 19,
                                ),
                                Container(
                                  height: heigh * 0.28,
                                  width: widt,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Fill An Outpass',
                                          style: GoogleFonts.merriweather(
                                            textStyle: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.5,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: heigh * 0.07,
                                          width: widt * 0.5,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD0D6D9),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Container(
                                          height: heigh * 0.07,
                                          width: widt * 0.5,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD0D6D9),
                                            borderRadius:
                                                BorderRadius.circular(30),
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
                          return Center(
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
