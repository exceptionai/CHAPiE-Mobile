import 'dart:async';
import 'dart:core';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnection {

  static final robotTable = {
    "tableName" : "robots",
    "idColumn" : "idRobot",
    "nameColumn" : "robot",
    "robotTypeColumn" : "robotType",
    "schemaUrlColumn" : "schemaUrl",
    "doneColumn" : "done"
  };

  static final schemaTable = {
    "tableName" : "schemas",
    "idColumn" : "idSchema",
    "nameColumn" : "schema",
    "schemaUrlColumn" : "schemaUrl",
    "descriptionColumn" : "description",
    
  };

  DbConnection();

  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }
  
  static Future _onConfigure (Database db) async {
      await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "chapie-coense.db");

    List<String> createQueryes = [
          """CREATE TABLE ${robotTable["tableName"]}(
          ${robotTable["idColumn"]} INTEGER PRIMARY KEY,
          ${robotTable["nameColumn"]} TEXT,
          ${robotTable["robotTypeColumn"]} TEXT,
          ${robotTable["schemaUrlColumn"]} TEXT,
          ${robotTable["doneColumn"]} INTEGER);""",
          """CREATE TABLE ${schemaTable["tableName"]}(
          ${schemaTable["idColumn"]} INTEGER PRIMARY KEY,
          ${schemaTable["nameColumn"]} TEXT,
          ${schemaTable["schemaUrlColumn"]} TEXT,
          ${schemaTable["descriptionColumn"]} TEXT);""",
    ];


    List<String> inserts = [

       """INSERT INTO ${robotTable["tableName"]} (${robotTable["idColumn"]},
        ${robotTable["nameColumn"]},
        ${robotTable["robotTypeColumn"]},
        ${robotTable["schemaUrlColumn"]},
        ${robotTable["doneColumn"]}) VALUES (1,'Chapie Coense','Android','assets/images/android.jpq',1);""",
        """INSERT INTO ${robotTable["tableName"]} (${robotTable["idColumn"]},
        ${robotTable["nameColumn"]},
        ${robotTable["robotTypeColumn"]},
        ${robotTable["schemaUrlColumn"]},
        ${robotTable["doneColumn"]}) VALUES (2,'Robaru Akombi','Babá','assets/images/baby-syster.jpg',0);""",
        """INSERT INTO ${robotTable["tableName"]} (${robotTable["idColumn"]},
        ${robotTable["nameColumn"]},
        ${robotTable["robotTypeColumn"]},
        ${robotTable["schemaUrlColumn"]},
        ${robotTable["doneColumn"]}) VALUES (3,'kagaru Nakama','Operário','assets/images/worker.jpg',1);""",
         """INSERT INTO ${schemaTable["tableName"]} (
        ${schemaTable["idColumn"]},
        ${schemaTable["nameColumn"]},
        ${schemaTable["schemaUrlColumn"]}) VALUES (1,'Android','assets/images/android.jpg');""",
                 """INSERT INTO ${schemaTable["tableName"]} (
        ${schemaTable["idColumn"]},
        ${schemaTable["nameColumn"]},
        ${schemaTable["schemaUrlColumn"]}) VALUES (2,'Babá','assets/images/baby-syster.jpg');""",
                 """INSERT INTO ${schemaTable["tableName"]} (
        ${schemaTable["idColumn"]},
        ${schemaTable["nameColumn"]},
        ${schemaTable["schemaUrlColumn"]}) VALUES (3,'Operário','assets/images/worker.jpg');""",
        """INSERT INTO ${schemaTable["tableName"]} (
        ${schemaTable["idColumn"]},
        ${schemaTable["nameColumn"]},
        ${schemaTable["schemaUrlColumn"]}) VALUES (4,'Militar','assets/images/military.jpg');""",

    ];

    return await openDatabase(path, version: 1, onConfigure: _onConfigure, onCreate: (Database db, int newerVersion) async {
    
    for (String create in createQueryes){
      await db.execute(create);
    }
    for (String insert in inserts){
      await db.execute(insert);
    }
      
    });
  }
}