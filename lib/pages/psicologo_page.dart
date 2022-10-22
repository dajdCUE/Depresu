import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PsicologoPage extends StatefulWidget {
  PsicologoPage({Key? key}) : super(key: key);

  @override
  State<PsicologoPage> createState() => _PsicologoPageState();
}

class _PsicologoPageState extends State<PsicologoPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Future cargarNombre() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('nombre');
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
              image: AssetImage('assets/bg1.png'),
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: height*0.1,),
                Text("Nuestros profesionales",style: GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.bold),),
              ],
            ),
            Container(
              width: width*0.8,
              height: height*0.65,
              //color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  
                  children: [
                    SizedBox(height: height*0.1,),
                    
                    SizedBox(height: 50,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black,width: 2)
                      ),
                      //color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/maria_psico.png', height: 200),
                          Column(
                            
                            children: [
                              Text("María",style: GoogleFonts.nunito(fontWeight: FontWeight.bold),),
                              Text("Terapeuta"),
                              SizedBox(height: 20,),
                              Text("24/10/22"),
                              Text("11:50 - 12:40")
                            ],
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),) ,
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 120)),
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(130, 202, 156, 1),) 
                      ),
                      onPressed: () {
                        
                      }, 
                      child: Text("Llamar", style: GoogleFonts.nunito(fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(height: 40,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black,width: 2)
                      ),
                      //color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/juan_psico.png', height: 200),
                          Column(
                            children: [
                              Text("Juan", style: GoogleFonts.nunito(fontWeight: FontWeight.bold),),
                              Text("Psicólogo"),
                              SizedBox(height: 20,),
                              Text("27/10/22"),
                              Text("11:30 - 12:30")
                            ],
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),) ,
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 120)),
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(130, 202, 156, 1),) 
                      ),
                      onPressed: () {
                        
                      }, 
                      child: Text("Llamar", style: GoogleFonts.nunito(fontWeight: FontWeight.bold),),
              
                    ),
                    SizedBox(height: 10,),
                     
                    SizedBox(height: 200,)
                    
                  ],
                ),
              ),
              
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),) ,
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 120)),
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(137, 55, 53, 1),) 
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: Text("Volver", style: GoogleFonts.nunito(fontWeight: FontWeight.bold),),
              
                    ),
                    SizedBox(height: height*0.05,)
              ],
            )
        ],
      ),
    );
  }
}