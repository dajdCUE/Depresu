import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:telefonica/model/consejo_model.dart';
import 'package:telefonica/model/frases_model.dart';
import 'package:telefonica/model/test_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,'datos.db');
    print(path);

    bool dBExist= await databaseExists(path);

    if(dBExist){
      print("La base de datos ya existe");
    }else{
      print("Creando una copia desde assets");
      try {
        await Directory(dirname(path)).create(recursive:true);

      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets","datos.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);


      await File(path).writeAsBytes(bytes,flush: true);

      print("Database copiada");
    }

    return openDatabase(path);
    
    // return await openDatabase(
    //   path,
    // );
  }



  Future<List<TestModel>> getTest() async{
    Database db = await instance.database;
    var test = await db.query('test', orderBy: 'Id');
    List<TestModel> testList = test.isNotEmpty?test.map((e) => TestModel.fromMap(e)).toList():[];
    return testList;

  }

  Future<List<FrasesModel>>  getFrasesMotivacion() async{
    Database db = await instance.database;
    var frase = await db.rawQuery('''SELECT Frase, Autor FROM frases WHERE Tipo='motivacion' ORDER BY RANDOM() LIMIT 1 ''');
    List<FrasesModel> fraserandom = frase.isNotEmpty?frase.map((e) => FrasesModel.fromMap(e)).toList():[];
    return fraserandom;
  }

  Future<List<FrasesModel>>  getFrasesReflexion() async{
    Database db = await instance.database;
    var frase = await db.rawQuery('''SELECT Frase, Autor FROM frases WHERE Tipo='reflexion' ORDER BY RANDOM() LIMIT 1 ''');
    List<FrasesModel> fraserandom = frase.isNotEmpty?frase.map((e) => FrasesModel.fromMap(e)).toList():[];
    return fraserandom;
  }

  Future<List<FrasesModel>>  getFrasesSuicidio() async{
    Database db = await instance.database;
    var frase = await db.rawQuery('''SELECT Frase, Autor FROM frases WHERE Tipo='suicidio' ORDER BY RANDOM() LIMIT 1 ''');
    List<FrasesModel> fraserandom = frase.isNotEmpty?frase.map((e) => FrasesModel.fromMap(e)).toList():[];
    return fraserandom;
  }

  Future<List<ConsejoModel>>  getConsejos() async{
    Database db = await instance.database;
    var consejo = await db.rawQuery('''SELECT Nombre, Texto FROM consejos ORDER BY RANDOM() LIMIT 1 ''');
    List<ConsejoModel> consejoRandom = consejo.isNotEmpty?consejo.map((e) => ConsejoModel.fromMap(e)).toList():[];
    return consejoRandom;
  }

  
}

