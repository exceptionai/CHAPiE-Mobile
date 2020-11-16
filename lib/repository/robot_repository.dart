import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/repository/db_connection.dart';
import 'package:sqflite/sqflite.dart';


class RobotRepository{

  final DbConnection dbConnection = DbConnection();
  final String table = DbConnection.robotTable["tableName"];
  final String idColumn = DbConnection.robotTable["idColumn"];
  final String nameColumn = DbConnection.robotTable["nameColumn"];
  final String doneColumn = DbConnection.robotTable["robotTypeColumn"];
  final String dateColumn = DbConnection.robotTable["schemaUrlColumn"];
 
  Future<List<RobotModel>> getAll() async {
    Database db = await dbConnection.db;
    List listMap = await db.rawQuery("SELECT * FROM $table");
    List<RobotModel> listModel = List();
    for(Map m in listMap){
      listModel.add(RobotModel.fromMap(m));
    }
    return listModel;
  }

  Future<RobotModel> save(RobotModel model) async {
    Database db = await dbConnection.db;
    model.id = await db.insert(table, model.toMap());
    return model;
  }

  Future<RobotModel> getById(int id) async {
    Database db = await dbConnection.db;
    List<Map> maps = await db.query(table,
      columns: [idColumn, nameColumn],
      where: "$idColumn = ?",
      whereArgs: [id]);
    if(maps.length > 0){
      return RobotModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    Database db = await dbConnection.db;
    return await db.delete(table, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> update(RobotModel model) async {
    Database db = await dbConnection.db;
    return await db.update(table,
        model.toMap(),
        where: "$idColumn = ?",
        whereArgs: [model.id]);
  }

  
  Future<int> getNumber() async {
    Database db = await dbConnection.db;
    return Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM $table"));
  }

  Future close() async {
    Database db = await dbConnection.db;
    db.close();
  }


}