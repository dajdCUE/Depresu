import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ObjetivoDiarioPage extends StatefulWidget {
  ObjetivoDiarioPage({Key? key}) : super(key: key);

  @override
  State<ObjetivoDiarioPage> createState() => _ObjetivoDiarioPageState();
}

class _ObjetivoDiarioPageState extends State<ObjetivoDiarioPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: height*0.07,
            child: Image(
              image: AssetImage('assets/diana.png'),
              width: width,
              height: height,
              fit: BoxFit.fitWidth,
            ),
          ),
          Image(
            image: AssetImage('assets/bg1.png'),
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Container(
            //alignment: Alignment.center,
            height: height*0.85,
            width: width*0.80,
            //color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("¿Has cumplido algún objetivo hoy?",style: GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: height*0.53,),
                ElevatedButton(
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    double? dormir = await prefs.getDouble('dormir');
                    double? alimentacion= await prefs.getDouble('alimentacion');
                    double? positivo = await prefs.getDouble('positivo');
                    double sumaTotal = dormir! + alimentacion! + positivo! + 1;
                    if(sumaTotal >= 3){
                      Navigator.pushReplacementNamed(context, '/motivacion');
                    }else if(sumaTotal >= 2 && sumaTotal<3){
                      Navigator.pushReplacementNamed(context, '/reflexion');
                    }else{
                      Navigator.pushReplacementNamed(context, '/suicidio');
                    }
                    //print(sumaTotal);
                    //Navigator.pushNamed(context, '/face');
                  }, 
                  child: Text("Dos o más", style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(500, 20)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(left: width*0.2,right: width*0.2)),
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(46, 44, 96, 1)) ,
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                    
                  ),
                ),
                ElevatedButton(
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    double? dormir = await prefs.getDouble('dormir');
                    double? alimentacion= await prefs.getDouble('alimentacion');
                    double? positivo = await prefs.getDouble('positivo');
                    double sumaTotal = dormir! + alimentacion! + positivo! + 0.5;
                    if(sumaTotal >= 3){
                      Navigator.pushReplacementNamed(context, '/motivacion');
                    }else if(sumaTotal >= 2 && sumaTotal<3){
                      Navigator.pushReplacementNamed(context, '/reflexion');
                    }else{
                      Navigator.pushReplacementNamed(context, '/suicidio');
                    }
                    //Navigator.pushNamed(context, '/face');
                  }, 
                  child: Text("Uno", style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(500, 20)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(left: width*0.3,right: width*0.3)),
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(46, 44, 96, 1)) ,
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                    
                  ),
                ),
                ElevatedButton(
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    double? dormir = await prefs.getDouble('dormir');
                    double? alimentacion= await prefs.getDouble('alimentacion');
                    double? positivo = await prefs.getDouble('positivo');
                    double sumaTotal = dormir! + alimentacion! + positivo! + 0.0;
                    if(sumaTotal >= 3){
                      Navigator.pushReplacementNamed(context, '/motivacion');
                    }else if(sumaTotal >= 2 && sumaTotal<3){
                      Navigator.pushReplacementNamed(context, '/reflexion');
                    }else{
                      Navigator.pushReplacementNamed(context, '/suicidio');
                    }
                    //Navigator.pushNamed(context, '/face');
                  }, 
                  child: Text("Cero", style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(500, 20)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(left: width*0.3,right: width*0.3)),
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(46, 44, 96, 1)) ,
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                    
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}