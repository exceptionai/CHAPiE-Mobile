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
    ];


    List<String> inserts = [

       """INSERT INTO ${robotTable["tableName"]} (${robotTable["idColumn"]},
        ${robotTable["nameColumn"]},
        ${robotTable["robotTypeColumn"]},
        ${robotTable["schemaUrlColumn"]},
        ${robotTable["doneColumn"]}) VALUES (1,'Chapie Coense','Chavoso','chapie',1);""",
        """INSERT INTO ${robotTable["tableName"]} (${robotTable["idColumn"]},
        ${robotTable["nameColumn"]},
        ${robotTable["robotTypeColumn"]},
        ${robotTable["schemaUrlColumn"]},
        ${robotTable["doneColumn"]}) VALUES (2,'Robaru Akombi','Ladrão','rabaru',0);""",
        """INSERT INTO ${robotTable["tableName"]} (${robotTable["idColumn"]},
        ${robotTable["nameColumn"]},
        ${robotTable["robotTypeColumn"]},
        ${robotTable["schemaUrlColumn"]},
        ${robotTable["doneColumn"]}) VALUES (3,'kagaru Nakama','Cagão','cagaru',1);""",
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