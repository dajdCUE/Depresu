import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../database/DB_Helper.dart';

class ConsejosPage extends StatefulWidget {
  ConsejosPage({Key? key}) : super(key: key);

  @override
  State<ConsejosPage> createState() => _ConsejosPageState();
}

class _ConsejosPageState extends State<ConsejosPage> {
  
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                    future: DatabaseHelper.instance.getConsejos(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 40, right: 40
                          ),
                          child: Column(
                            children: [
                              Text(snapshot.data![0].Nombre, style: GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text(snapshot.data![0].Texto,style: GoogleFonts.nunito(),)
                            ],
                          ),
                        );
                      }else{
                        return CircularProgressIndicator();
                      }
                    
                  },),
                  SizedBox(height: 40,),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40)),
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(130, 202, 156, 1))
                    ),
                    child: Text("Volver",style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
            ],
          )
        ],

      ),
    );
  }
}