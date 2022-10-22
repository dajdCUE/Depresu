import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telefonica/database/DB_Helper.dart';
import 'package:telefonica/model/test_model.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  //Inicial Group value

  var _result1;
  var _result2;
  var _result3;
  var _result4;
  var _result5;
  var _result6;
  var _result7;
  var _result8;
  var _result9;
  var _result10;
  var _result11;
  var _result12;
  var _result13;
  var _result14;
  var _result15;
  var _result16;
  var _result17;
  var _result18;
  var _result19;
  var _result20;
  var _result21;

  int Depresion(int r3, int r5, int r10, int r13, int r16, int r17, int r21) {
    int suma = r3 + r5 + r10 + r13 + r16 + r17 + r21;
    return suma;
  }

  int Ansiedad(int r2, int r4, int r7, int r9, int r15, int r19, int r20) {
    int suma = r2 + r4 + r7 + r9 + r15 + r19 + r20;
    return suma;
  }

  int Estres(int r1, int r6, int r8, int r11, int r12, int r14, int r18) {
    int suma = r1 + r6 + r8 + r11 + r12 + r14 + r18;
    return suma;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 1),
      body: Stack(
        children: [
          Positioned(
            bottom: height * 0.8,
            right: width * 0.45,
            child: Transform.rotate(
              angle: 75,
              child: Container(
                height: 360,
                width: 360,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 25),
                    ],
                    borderRadius: BorderRadius.circular(80),
                    color: Color.fromRGBO(227, 44, 104, 1)),
              ),
            ),
          ),
          Positioned(
            top: height * 0.8,
            left: width * 0.55,
            child: Transform.rotate(
              angle: 75,
              child: Container(
                height: 360,
                width: 360,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 25),
                    ],
                    borderRadius: BorderRadius.circular(80),
                    color: Color.fromRGBO(158, 217, 229, 1)),
              ),
            ),
          ),
          FutureBuilder(
            future: DatabaseHelper.instance.getTest(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text(
                      "Test semanal",
                      style: GoogleFonts.nunito(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "     0: No me ha ocurrido",
                      style: GoogleFonts.nunito(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "     1: Me ha ocurrido un poco",
                      style: GoogleFonts.nunito(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "     2: Me ha ocurrido bastante",
                      style: GoogleFonts.nunito(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "     3: Me ha ocurrido mucho",
                      style: GoogleFonts.nunito(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    card1(snapshot),
                    card2(snapshot),
                    card3(snapshot),
                    card4(snapshot),
                    card5(snapshot),
                    card6(snapshot),
                    card7(snapshot),
                    card8(snapshot),
                    card9(snapshot),
                    card10(snapshot),
                    card11(snapshot),
                    card12(snapshot),
                    card13(snapshot),
                    card14(snapshot),
                    card15(snapshot),
                    card16(snapshot),
                    card17(snapshot),
                    card18(snapshot),
                    card19(snapshot),
                    card20(snapshot),
                    card21(snapshot),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 40)),
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(130, 202, 156, 1))),
                          onPressed: () async{
                            final prefs = await SharedPreferences.getInstance();
                            final depresion = Depresion(_result3,_result5, _result10, _result13, _result16, _result17,_result21);
                            final ansiedad = Ansiedad (_result2,_result4,_result7,_result9,_result15,_result19,_result20);
                            final estres = Estres(_result1,_result6, _result8, _result11, _result12, _result14,_result18);
                            print("$depresion + $ansiedad + $estres");
                            await prefs.setInt('depresion', depresion);
                            await prefs.setInt('ansiedad', ansiedad);
                            await prefs.setInt('estres', estres);
                            Navigator.pushReplacementNamed(
                                context, '/resultados');
                          },
                          child: Text(
                            "Terminar",
                            style: GoogleFonts.nunito(
                                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                          )),
                    )
                  ],
                );
                // return ListView(

                //   children: snapshot.data!.map((e) {
                //     return Card(
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                //       elevation: 10,
                //       shadowColor: Colors.black,
                //       color: Color.fromRGBO(33  , 173, 216, 1),
                //       margin: EdgeInsets.all(20),
                //       child: Padding(
                //         padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 1),
                //         child: Column(
                //           children: [
                //             Text(
                //               e.pregunta,
                //               style: GoogleFonts.nunito(
                //                   fontSize: 20, fontWeight: FontWeight.bold),
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //               children: [
                //                 Radio(

                //                     value: 0,
                //                     groupValue: _result,
                //                     onChanged: (value) {
                //                       setState(() {
                //                         _result = value;
                //                       });
                //                     }),
                //                 Radio(
                //                     value: 1,
                //                     groupValue: _result,
                //                     onChanged: (value) {
                //                       setState(() {
                //                         _result = value;
                //                       });
                //                     }),
                //                 Radio(
                //                     value: 2,
                //                     groupValue: _result,
                //                     onChanged: (value) {
                //                       setState(() {
                //                         _result = value;
                //                       });
                //                     }),
                //                 Radio(
                //                     value: 3,
                //                     groupValue: _result,
                //                     onChanged: (value) {
                //                       setState(() {
                //                         _result = value;
                //                       });
                //                     }),
                //               ],
                //             )
                //           ],
                //         ),
                //       ),
                //     );
                //   }).toList(),
                // );
              }
            },
          )
        ],
      ),
    );
  }

  Card card1(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![0].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result1,
                  onChanged: (value) {
                    setState(() {
                      _result1 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result1,
                  onChanged: (value) {
                    setState(() {
                      _result1 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result1,
                  onChanged: (value) {
                    setState(() {
                      _result1 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result1,
                    onChanged: (value) {
                      setState(() {
                        _result1 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card2(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![1].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result2,
                  onChanged: (value) {
                    setState(() {
                      _result2 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result2,
                  onChanged: (value) {
                    setState(() {
                      _result2 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result2,
                  onChanged: (value) {
                    setState(() {
                      _result2 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result2,
                    onChanged: (value) {
                      setState(() {
                        _result2 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card3(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![2].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result3,
                  onChanged: (value) {
                    setState(() {
                      _result3 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result3,
                  onChanged: (value) {
                    setState(() {
                      _result3 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result3,
                  onChanged: (value) {
                    setState(() {
                      _result3 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result3,
                    onChanged: (value) {
                      setState(() {
                        _result3 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card4(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![3].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result4,
                  onChanged: (value) {
                    setState(() {
                      _result4 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result4,
                  onChanged: (value) {
                    setState(() {
                      _result4 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result4,
                  onChanged: (value) {
                    setState(() {
                      _result4 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result4,
                    onChanged: (value) {
                      setState(() {
                        _result4 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card5(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![4].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result5,
                  onChanged: (value) {
                    setState(() {
                      _result5 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result5,
                  onChanged: (value) {
                    setState(() {
                      _result5 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result5,
                  onChanged: (value) {
                    setState(() {
                      _result5 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result5,
                    onChanged: (value) {
                      setState(() {
                        _result5 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card6(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![5].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result6,
                  onChanged: (value) {
                    setState(() {
                      _result6 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result6,
                  onChanged: (value) {
                    setState(() {
                      _result6 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result6,
                  onChanged: (value) {
                    setState(() {
                      _result6 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result6,
                    onChanged: (value) {
                      setState(() {
                        _result6 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card7(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![6].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result7,
                  onChanged: (value) {
                    setState(() {
                      _result7 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result7,
                  onChanged: (value) {
                    setState(() {
                      _result7 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result7,
                  onChanged: (value) {
                    setState(() {
                      _result7 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result7,
                    onChanged: (value) {
                      setState(() {
                        _result7 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card8(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![7].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result8,
                  onChanged: (value) {
                    setState(() {
                      _result8 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result8,
                  onChanged: (value) {
                    setState(() {
                      _result8 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result8,
                  onChanged: (value) {
                    setState(() {
                      _result8 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result8,
                    onChanged: (value) {
                      setState(() {
                        _result8 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card9(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![8].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result9,
                  onChanged: (value) {
                    setState(() {
                      _result9 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result9,
                  onChanged: (value) {
                    setState(() {
                      _result9 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result9,
                  onChanged: (value) {
                    setState(() {
                      _result9 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result9,
                    onChanged: (value) {
                      setState(() {
                        _result9 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card10(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![9].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result10,
                  onChanged: (value) {
                    setState(() {
                      _result10 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result10,
                  onChanged: (value) {
                    setState(() {
                      _result10 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result10,
                  onChanged: (value) {
                    setState(() {
                      _result10 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result10,
                    onChanged: (value) {
                      setState(() {
                        _result10 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card11(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![10].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result11,
                  onChanged: (value) {
                    setState(() {
                      _result11 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result11,
                  onChanged: (value) {
                    setState(() {
                      _result11 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result11,
                  onChanged: (value) {
                    setState(() {
                      _result11 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result11,
                    onChanged: (value) {
                      setState(() {
                        _result11 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card12(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![11].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result12,
                  onChanged: (value) {
                    setState(() {
                      _result12 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result12,
                  onChanged: (value) {
                    setState(() {
                      _result12 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result12,
                  onChanged: (value) {
                    setState(() {
                      _result12 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result12,
                    onChanged: (value) {
                      setState(() {
                        _result12 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card13(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![12].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result13,
                  onChanged: (value) {
                    setState(() {
                      _result13 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result13,
                  onChanged: (value) {
                    setState(() {
                      _result13 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result13,
                  onChanged: (value) {
                    setState(() {
                      _result13 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result13,
                    onChanged: (value) {
                      setState(() {
                        _result13 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card14(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![13].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result14,
                  onChanged: (value) {
                    setState(() {
                      _result14 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result14,
                  onChanged: (value) {
                    setState(() {
                      _result14 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result14,
                  onChanged: (value) {
                    setState(() {
                      _result14 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result14,
                    onChanged: (value) {
                      setState(() {
                        _result14 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card15(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![14].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result15,
                  onChanged: (value) {
                    setState(() {
                      _result15 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result15,
                  onChanged: (value) {
                    setState(() {
                      _result15 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result15,
                  onChanged: (value) {
                    setState(() {
                      _result15 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result15,
                    onChanged: (value) {
                      setState(() {
                        _result15 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card16(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![15].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result16,
                  onChanged: (value) {
                    setState(() {
                      _result16 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result16,
                  onChanged: (value) {
                    setState(() {
                      _result16 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result16,
                  onChanged: (value) {
                    setState(() {
                      _result16 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result16,
                    onChanged: (value) {
                      setState(() {
                        _result16 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card17(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![16].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result17,
                  onChanged: (value) {
                    setState(() {
                      _result17 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result17,
                  onChanged: (value) {
                    setState(() {
                      _result17 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result17,
                  onChanged: (value) {
                    setState(() {
                      _result17 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result17,
                    onChanged: (value) {
                      setState(() {
                        _result17 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card18(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![17].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result18,
                  onChanged: (value) {
                    setState(() {
                      _result18 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result18,
                  onChanged: (value) {
                    setState(() {
                      _result18 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result18,
                  onChanged: (value) {
                    setState(() {
                      _result18 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result18,
                    onChanged: (value) {
                      setState(() {
                        _result18 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card19(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![18].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result19,
                  onChanged: (value) {
                    setState(() {
                      _result19 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result19,
                  onChanged: (value) {
                    setState(() {
                      _result19 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result19,
                  onChanged: (value) {
                    setState(() {
                      _result19 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result19,
                    onChanged: (value) {
                      setState(() {
                        _result19 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card20(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![19].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result20,
                  onChanged: (value) {
                    setState(() {
                      _result20 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result20,
                  onChanged: (value) {
                    setState(() {
                      _result20 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result20,
                  onChanged: (value) {
                    setState(() {
                      _result20 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result20,
                    onChanged: (value) {
                      setState(() {
                        _result20 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Card card21(AsyncSnapshot<List<TestModel>> snapshot) {
    return Card(
      color: Color.fromRGBO(33, 173, 216, 1),
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data![20].pregunta,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("0"),
                  value: 0,
                  groupValue: _result21,
                  onChanged: (value) {
                    setState(() {
                      _result21 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("1"),
                  value: 1,
                  groupValue: _result21,
                  onChanged: (value) {
                    setState(() {
                      _result21 = value;
                    });
                  },
                ),
                Radio(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  //title: Text("2"),
                  value: 2,
                  groupValue: _result21,
                  onChanged: (value) {
                    setState(() {
                      _result21 = value;
                    });
                  },
                ),
                Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    //title: Text("3"),
                    value: 3,
                    groupValue: _result21,
                    onChanged: (value) {
                      setState(() {
                        _result21 = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "1",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(),
                ),
                Text(
                  "3",
                  style: GoogleFonts.nunito(),
                )
              ],
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }
}
