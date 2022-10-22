import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CosasPositivasPage extends StatefulWidget {
  CosasPositivasPage({Key? key}) : super(key: key);

  @override
  State<CosasPositivasPage> createState() => _CosasPositivasPageState();
}

class _CosasPositivasPageState extends State<CosasPositivasPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage('assets/corazon.png'),
            width: width,
            height: height,
            fit: BoxFit.fitWidth,
          ),
          Image(
            image: AssetImage('assets/bg1.png'),
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Container(
            //alignment: Alignment.center,
            height: height*0.876,
            width: width*0.80,
            //color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("¿Cuántas cosas positivas te han pasado hoy?",style: GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: height*0.50,),
                ElevatedButton(
                  onPressed: ()async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setDouble('positivo', 1.0);
                    Navigator.pushNamed(context, '/diario');
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
                    await prefs.setDouble('positivo', 0.5);
                    Navigator.pushNamed(context, '/diario');
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
                    await prefs.setDouble('positivo', 0.0);
                    Navigator.pushNamed(context, '/diario');
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