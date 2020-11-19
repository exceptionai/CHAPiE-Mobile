import 'package:FiapEx/models/schema.dart';
import 'package:FiapEx/repository/db_connection.dart';
import 'package:sqflite/sqflite.dart';


class SchemaRepository{

  final DbConnection dbConnection = DbConnection();
  final String table = DbConnection.schemaTable["tableName"];
  final String idColumn = DbConnection.schemaTable["idColumn"];
  final String nameColumn = DbConnection.schemaTable["nameColumn"];
  final String doneColumn = DbConnection.schemaTable["schemaTypeColumn"];
  final String schemaColumn = DbConnection.schemaTable["schemaUrlColumn"];
 
  Future<List<SchemaModel>> getAll() async {
    Database db = await dbConnection.db;
    List listMap = await db.rawQuery("SELECT * FROM $table");
    List<SchemaModel> listModel = List();
    for(Map m in listMap){
      listModel.add(SchemaModel.fromMap(m));
    }
    return listModel;
  }

  Future<SchemaModel> save(SchemaModel model) async {
    Database db = await dbConnection.db;
    model.id = await db.insert(table, model.toMap());
    return model;
  }

  Future<SchemaModel> getById(int id) async {
    Database db = await dbConnection.db;
    List<Map> maps = await db.query(table,
      columns: [idColumn, nameColumn],
      where: "$idColumn = ?",
      whereArgs: [id]);
    if(maps.length > 0){
      return SchemaModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    Database db = await dbConnection.db;
    return await db.delete(table, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> update(SchemaModel model) async {
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

  Future<int> getNextID() async {
    Database db = await dbConnection.db;
    return Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM $table")) + 1;
  }

  Future close() async {
    Database db = await dbConnection.db;
    db.close();
  }


}