import 'package:FiapEx/repository/db_connection.dart';

class RobotModel {

  int id;
  String _id;
  String name;
  String robotType;
  String schemaUrl;
  int done;

  final String idColumn = DbConnection.robotTable["idColumn"];
  final String nameColumn = DbConnection.robotTable["nameColumn"];
  final String robotTypeColumn = DbConnection.robotTable["robotTypeColumn"];
  final String schemaUrlColumn = DbConnection.robotTable["schemaUrlColumn"];
  final String doneColumn = DbConnection.robotTable["doneColumn"];

  RobotModel();

  RobotModel.fromMap(Map map){
    id = map[idColumn];
    _id = map["_id"];
    name = map[nameColumn];
    robotType = map[robotTypeColumn];
    schemaUrl = map[schemaUrlColumn];
    done = map[doneColumn];
  }

  Map toMap(){
    Map<String,dynamic> map = {
      idColumn : id,
      nameColumn : name,
      robotTypeColumn : robotType,
      schemaUrlColumn : schemaUrl,
      doneColumn : done,
    };
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id : ${this.id}, nome : ${this.name}, done : ${this.done}                                                         ";
  }

  
}