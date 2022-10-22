import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlimentationPage extends StatefulWidget {
  AlimentationPage({Key? key}) : super(key: key);

  @override
  State<AlimentationPage> createState() => _AlimentationPageState();
}

class _AlimentationPageState extends State<AlimentationPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage('assets/verduras.png'),
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
            height: height*0.8,
            width: width*0.80,
            //color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("¿Has comido bien?",style: GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: height*0.55,),
                ElevatedButton(
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setDouble('alimentacion', 1.0);
                    Navigator.pushNamed(context, '/positivo');
                  }, 
                  child: Text("Bien", style: GoogleFonts.nunito(
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
                    
                    await prefs.setDouble('alimentacion', 0.5);
                    
                    Navigator.pushNamed(context, '/positivo');
                  }, 
                  child: Text("Regular", style: GoogleFonts.nunito(
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
                    await prefs.setDouble('alimentacion', 0.0);
                    Navigator.pushNamed(context, '/positivo');
                  }, 
                  child: Text("Mal", style: GoogleFonts.nunito(
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