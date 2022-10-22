import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultadosPage extends StatefulWidget {
  ResultadosPage({Key? key}) : super(key: key);

  @override
  State<ResultadosPage> createState() => _ResultadosPageState();
}

class _ResultadosPageState extends State<ResultadosPage> {
  Future cargarDepresion() async {
    final prefs = await SharedPreferences.getInstance();
    int? depresion= prefs.getInt('depresion');
    if(depresion! < 5 ){
      return 0.0;
    }else if(depresion == 5 || depresion == 6){
      return 0.25;
    }else if(depresion > 6 && depresion <11){
      return 0.50;
    }else if(depresion > 10 && depresion < 14 ){
      return 0.75;
    }else if(depresion >= 14){
      return 1.0;
    }

  }

  Future cargarAnsiedad() async {
    final prefs = await SharedPreferences.getInstance();
    int? ansiedad= prefs.getInt('ansiedad');
    if(ansiedad! < 3 ){
      return 0.0;
    }else if(ansiedad == 4){
      return 0.25;
    }else if(ansiedad > 4 && ansiedad <8){
      return 0.50;
    }else if(ansiedad == 8 || ansiedad ==9){
      return 0.75;
    }else if(ansiedad >= 10){
      return 1.0;
    }
  }

  Future cargarEstres() async {
    final prefs = await SharedPreferences.getInstance();
    int? estres =  prefs.getInt('estres');
    if(estres! < 8 ){
      return 0.0;
    }else if(estres == 8 || estres == 9){
      return 0.25;
    }else if(estres > 9 && estres <13){
      return 0.50;
    }else if(estres > 12 && estres < 17 ){
      return 0.75;
    }else if(estres >= 17){
      return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 1),
      body: Stack(
        alignment: Alignment.center,
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
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  "Resultados",
                  style: GoogleFonts.nunito(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                
                FutureBuilder(
                  future: cargarDepresion(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Depresión",style: GoogleFonts.nunito(fontSize: 30),),
                          SizedBox(height: 30,),
                          Container(
                            //color: Colors.red,
                            width: width*0.20,
                            height: height*0.1,
                            child: 
                            CircularProgressIndicator(
                              backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              strokeWidth: 25,
                              color: Color.fromRGBO(234, 67, 58, 1),
                              value: snapshot.data,
                            )
                            // LinearProgressIndicator(
                            //   backgroundColor: Colors.blue,
                            //   color: Colors.red,
                            //   minHeight: 20,
                            //   semanticsValue: snapshot.data.toString(),
                            //   semanticsLabel: snapshot.data.toString(),
                            //   value: snapshot.data!,
                            // ),
                          ),
                        ],
                      );
                    }else{
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 30,),
                FutureBuilder(
                  future: cargarAnsiedad(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Ansiedad",style: GoogleFonts.nunito(fontSize: 30),),
                          SizedBox(height: 30,),
                          Container(
                            //color: Colors.red,
                            width: width*0.20,
                            height: height*0.1,
                            child: 
                            CircularProgressIndicator(
                              backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              strokeWidth: 25,
                              color: Color.fromRGBO(44, 79, 129, 1),
                              value: snapshot.data,
                            )
                            // LinearProgressIndicator(
                            //   backgroundColor: Colors.blue,
                            //   color: Colors.red,
                            //   minHeight: 20,
                            //   semanticsValue: snapshot.data.toString(),
                            //   semanticsLabel: snapshot.data.toString(),
                            //   value: snapshot.data!,
                            // ),
                          ),
                        ],
                      );
                    }else{
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 30,),
                FutureBuilder(
                  future: cargarEstres(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Estrés",style: GoogleFonts.nunito(fontSize: 30),),
                          SizedBox(height: 30,),
                          Container(
                            //color: Colors.red,
                            width: width*0.20,
                            height: height*0.1,
                            child: 
                            CircularProgressIndicator(
                              backgroundColor: Color.fromARGB(255, 219, 219, 219),
                              strokeWidth: 25,
                              color: Color.fromRGBO(114, 194, 83, 1),
                              value: snapshot.data,
                            )
                            // LinearProgressIndicator(
                            //   backgroundColor: Colors.blue,
                            //   color: Colors.red,
                            //   minHeight: 20,
                            //   semanticsValue: snapshot.data.toString(),
                            //   semanticsLabel: snapshot.data.toString(),
                            //   value: snapshot.data!,
                            // ),
                          ),
                        ],
                      );
                    }else{
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 40,),
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
