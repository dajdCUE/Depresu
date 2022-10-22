import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    

    
    
    return Scaffold(
      body: Stack(
      children: [
        
        Image(image: AssetImage('assets/bg1.png'),width: width,height: height,fit: BoxFit.fill,),
        Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("¡Hola!", style: GoogleFonts.nunito(color: Colors.black, fontSize: 60, fontWeight: FontWeight.bold),),
              Text("¿Cómo te llamas?", style: GoogleFonts.nunito(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold,),textAlign: TextAlign.center, ),
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.only(left: 50,right: 50),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controller,
                  maxLines: 1,
                  decoration: InputDecoration(
                    
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: "Benito Camela",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  autocorrect: false,

                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.black
                  )
                ),
                onPressed: () async{
                  final prefs = await SharedPreferences.getInstance();
                  String nombre = controller.text;
                  await prefs.setString('nombre', nombre);
                  await prefs.setBool('seen', true);
                  print(nombre);
                  Navigator.pushReplacementNamed(context, '/home');
                }, 
                child: Text("Bienvenido", style: GoogleFonts.nunito(fontSize: 30),))
            ],
          ),
        ),
      ]
      ),
    );
  }
}