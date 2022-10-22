import 'package:flutter/material.dart';
import 'package:telefonica/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayudame',
      initialRoute: '/splash',
      routes: {
        '/home':(context) => HomePage(),
        
        '/suicidio': (context) => SuicidioPage(),
        '/reflexion':(context) => ReflexionPage(),
        '/motivacion': (context) => MotivationPage(),
        '/login': (context) => LoginPage(),
        '/test':(context) => TestPage(),
        '/splash': (context) => Splash(),
        '/testdiario':(context) => TestDiario(),
        '/alimentacion':(context) => AlimentationPage(),
        '/positivo':(context) => CosasPositivasPage(),
        '/diario':(context) => ObjetivoDiarioPage(),
        '/psicologo': (context) => PsicologoPage(),
        '/consejos':(context) => ConsejosPage(),
        '/resultados': (context) => ResultadosPage()
      },
    );
  }
}