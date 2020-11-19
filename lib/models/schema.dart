import 'package:FiapEx/repository/db_connection.dart';

class SchemaModel {

  int id;
  String name;
  String schemaUrl;
  String description;

  final String idColumn = DbConnection.schemaTable["idColumn"];
  final String nameColumn = DbConnection.schemaTable["nameColumn"];
  final String schemaUrlColumn = DbConnection.schemaTable["schemaUrlColumn"];
  final String descriptionColumn = DbConnection.schemaTable["descriptionColumn"];

  SchemaModel();

  SchemaModel.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    schemaUrl = map[schemaUrlColumn];
    description = map[descriptionColumn];
  }

  Map toMap(){
    Map<String,dynamic> map = {
      idColumn : id,
      nameColumn : name,
      schemaUrlColumn : schemaUrl,
      descriptionColumn : description
    };
    print(map.toString());
    return map;
  }

  
}