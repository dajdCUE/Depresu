import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestDiario extends StatefulWidget {
  TestDiario({Key? key}) : super(key: key);

  @override
  State<TestDiario> createState() => _TestDiarioState();
}

class _TestDiarioState extends State<TestDiario> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage('assets/lunabg.png'),
            width: width,
            height: height,
            fit: BoxFit.fill,
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
                Text("¿Cómo has dormido?",style: GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: height*0.5,),
                ElevatedButton(
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setDouble('dormir', 1.0);
                    Navigator.pushNamed(context, '/alimentacion');
                  }, 
                  child: Text("Bien", style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(500, 20)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(left: width*0.3,right: width*0.3)),
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(243, 189, 115, 1)) ,
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                    
                  ),
                ),
                ElevatedButton(
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setDouble('dormir', 0.5);
                     Navigator.pushNamed(context, '/alimentacion');
                  }, 
                  child: Text("Regular", style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(500, 20)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(left: width*0.2,right: width*0.2)),
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(243, 189, 115, 1)) ,
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                    
                  ),
                ),
                ElevatedButton(
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setDouble('dormir',0);
                     Navigator.pushNamed(context, '/alimentacion');
                  }, 
                  child: Text("Mal", style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(500, 20)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(left: width*0.3,right: width*0.3)),
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(243, 189, 115, 1)) ,
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
