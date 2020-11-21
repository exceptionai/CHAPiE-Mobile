//SERVIRA PARA CONSOLIDAR TODAS AS INFORMAÇÕES//
import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/models/schema.dart';
import 'package:FiapEx/repository/robot_repository.dart';
import 'package:FiapEx/repository/schema_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CharpieService{
  
  RobotRepository robotRepository = RobotRepository();
  SchemaRepository schemaRepository = SchemaRepository();

  final chapieAPI = 'https://5fb830992f145f0016c3c389.mockapi.io/';
  /*adicionar restantes dos repositorios*/
  
  Future<List<RobotModel>> getAllRobots() async{
    // List<RobotModel> rows = await robotRepository.getAll();
    var robotsResponse = await http.get('$chapieAPI/Robot');
    var robotsJSON = json.decode(robotsResponse.body);
    List<RobotModel> robots = robotsJSON.map<RobotModel>((robot) => RobotModel.fromMap(robot)).toList();
    return robots;
  }

  Future endProductionOfRobots() async{
    List<RobotModel> robots = await getAllRobots();
    for(var robot in robots){
      robot.done = 1;
      await endProductionOfRobot(robot.getServiceId(), robot);

    }
    
    
  }

  endProductionOfRobot(String id, RobotModel robot) async{
    await http.put('$chapieAPI/Robot/$id',headers: {'Content-type': 'application/json'}, body: json.encode(robot.toMap()));
  }

  Future<List<SchemaModel>> getAllSchemas() async{
    // List<SchemaModel> rows = await schemaRepository.getAll();
    
    var schemasResponse = await http.get('$chapieAPI/Schema');
    var schemasJSON = json.decode(schemasResponse.body);
    List<SchemaModel> schemas = schemasJSON.map<SchemaModel>((schema) => SchemaModel.fromMap(schema)).toList();
    return schemas;
  }

  getNextID() async {
     int id = await robotRepository.getNextID();
     return id;
   }

  getNextSchemaId() async {
     int id = await schemaRepository.getNextID();
     return id;
  }

  Future saveRobot(RobotModel model) async {
    await http.post('$chapieAPI/Robot',headers: {'Content-type': 'application/json'}, body: json.encode(model.toMap()));
  }

  Future saveSchema(SchemaModel model) async {
    if(model.name != null && model.description != null && model.schemaUrl != null){
      await http.post('$chapieAPI/Schema',headers: {'Content-type': 'application/json'}, body: json.encode(model.toMap()));
    }
  }

   Future<List<Map<String,Object>>> GenerateListSchemes() async {
     List<SchemaModel> schemas = await getAllSchemas();
     List<Map<String,Object>> formatedSchemas;
     schemas.forEach((element) {
       formatedSchemas.add({
         'text' : element.name,
         'value' : element.schemaUrl
        });
     });
     return formatedSchemas;
   }


  Future selfDestruct(String id) async{
    await http.delete('$chapieAPI/Robot/$id');
  }


}