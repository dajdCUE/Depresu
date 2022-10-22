import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telefonica/pages/pages.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future checkScreen() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool _seen = (prefs.getBool('seen')??false);

      if(_seen){
        return HomePage.id;
      }else{
        return LoginPage.id;
      }
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkScreen(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }if (snapshot.data == "HomePage") {
          return HomePage();
        }else{
          return LoginPage();
        }
      },
    );
  }
}