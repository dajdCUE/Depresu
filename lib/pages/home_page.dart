import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final controller = ScrollController();

    Future cargarNombre() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('nombre');
    }

    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(

        //   backgroundColor: Color.fromARGB(255, 9, 79, 95),
        //   currentIndex: 1,
        //   items: [
        //   BottomNavigationBarItem(
        //     label: "Calendar",
        //     icon: Icon(Icons.calendar_month_rounded,color: Color.fromRGBO(227, 44, 104, 1),)),
        //   BottomNavigationBarItem(
            
        //     label: "Home",
        //     icon: Icon(Icons.home,color: Color.fromRGBO(227, 44, 104, 1),)),
        // ]),
        backgroundColor: Color.fromRGBO(234, 234, 234, 1),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image(
              image: AssetImage('assets/bg1.png'),
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 50),
                    Text(
                      "¡Hola! ",
                      style: GoogleFonts.nunito(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder(
                        future: cargarNombre(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Text(
                              snapshot.data,
                              style: GoogleFonts.nunito(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                   
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //shape: BoxShape.rectangle
                  ),
                  alignment: Alignment.center,
                  height: height * 0.75,
                  width: width * 0.85,
                  
                  //color: Colors.red,
                  child: SingleChildScrollView(
                    controller: controller,
                      physics: ScrollPhysics(),
                      child: Column(children: [
                    
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/testdiario');
                      },
                      child: Container(
                        width: width * 0.85,
                        height: height * 0.20,
                        child: Card(
                          color: Color.fromRGBO(245, 150, 41, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            //trailing: Image(image: AssetImage('assets/chica1.png'),height: ,),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Test diario",
                                    style: GoogleFonts.nunito(
                                        fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  Image(
                                    image: AssetImage('assets/chica1.png'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.pushNamed(context, '/test');
                        print("Pulsate");
                      },
                      child: Container(
                        height: height * 0.20,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            //trailing: Image(image: AssetImage('assets/chica1.png'),height: ,),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Test de",
                                        style: GoogleFonts.nunito(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "autoayuda",
                                        style: GoogleFonts.nunito(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Image(
                                    image: AssetImage('assets/libros2.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              )
                            ],
                          ),
                          color: Color.fromRGBO(23, 136, 89, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/psicologo');
                      },
                      child: Container(
                        height: height * 0.20,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            //trailing: Image(image: AssetImage('assets/chica1.png'),height: ,),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Psicólogos",
                                    style: GoogleFonts.nunito(
                                        fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  Image(
                                    image: AssetImage('assets/hombre3.png'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ],
                              )
                            ],
                          ),
                          color: Color.fromRGBO(217, 95, 95, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/consejos');
                      },
                      child: Container(
                        height: height * 0.20,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            //trailing: Image(image: AssetImage('assets/chica1.png'),height: ,),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Consejos",
                                    style: GoogleFonts.nunito(
                                        fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  Image(
                                    image: AssetImage('assets/info4.png'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ],
                              )
                            ],
                          ),
                          color: Color.fromRGBO(170, 100, 206, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, '/consejos');
                      },
                      child: Container(
                        height: height * 0.20,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            //trailing: Image(image: AssetImage('assets/chica1.png'),height: ,),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Enlazar",
                                    style: GoogleFonts.nunito(
                                        fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  Image(
                                    //height: height*0.20,
                                    image: AssetImage('assets/syncro.png',),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ],
                              )
                            ],
                          ),
                          color: Color.fromRGBO(163, 164, 171, 1),
                        ),
                      ),
                    ),
                  ])),
                ),
              ],
            ),
            
            
          ],
        ),
      ),
    );
  }
}
