import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telefonica/database/DB_Helper.dart';
class MotivationPage extends StatefulWidget {
  const MotivationPage({Key? key}) : super(key: key);

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {



  
  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Future cargarNombre() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('nombre');
    }
    


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
          Container(
            width: width,
            height: height,
            child: Column(
              children: [
                SizedBox(height: height*0.1,),
                FutureBuilder(
                  future: cargarNombre(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Text("¡Genial "+
                              snapshot.data+"!",
                              style: GoogleFonts.nunito(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                  },),
                  SizedBox(height: height*0.1,),
                  Image(image: AssetImage('assets/feliz.png',),height: height*0.3,),
                  SizedBox(height: height*0.05,),
                  FutureBuilder(
                    future: DatabaseHelper.instance.getFrasesMotivacion(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 40, right: 40
                          ),
                          child: Column(
                            children: [
                              Text(snapshot.data![0].Frase, style: GoogleFonts.nunito(fontSize: 17, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text(snapshot.data![0].Autor)
                            ],
                          ),
                        );
                      }else{
                        return CircularProgressIndicator();
                      }
                    
                  },),
                  SizedBox(height: height*0.02,),
                  ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, '/home');
                  }, 
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(46, 44, 96, 1),
                    
                  ),),
                   
                  child: Text("Home", style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),))
              ],
            ),
          )
        ],
      ),
    );
  }
}