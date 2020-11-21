//SERVIRA PARA CONSOLIDAR TODAS AS INFORMAÇÕES//
import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/models/schema.dart';
import 'package:FiapEx/repository/robot_repository.dart';
import 'package:FiapEx/repository/schema_repository.dart';

class CharpieService{
  
  RobotRepository robotRepository = RobotRepository();
  SchemaRepository schemaRepository = SchemaRepository();
  /*adicionar restantes dos repositorios*/
  
  Future<List<RobotModel>> getAllRobots() async{
    List<RobotModel> rows = await robotRepository.getAll();
    return rows;
  }

  void endProductionOfRobots() async{
    List<RobotModel> rows = await robotRepository.getAll();
    rows.forEach((element) {
      element.done = 1;
      robotRepository.update(element);
    });
  }

  Future<List<SchemaModel>> getAllSchemas() async{
    List<SchemaModel> rows = await schemaRepository.getAll();
    return rows;
  }

  getNextID() async {
     int id = await robotRepository.getNextID();
     return id;
   }

  void deleteRobot(int id) async {
    robotRepository.delete(id);
  }

  getNextSchemaId() async {
     int id = await schemaRepository.getNextID();
     return id;
  }

  Future<RobotModel> saveRobot(RobotModel model) async {
    return robotRepository.save(model);
  }

  Future<SchemaModel> saveSchema(SchemaModel model) async {
    return schemaRepository.save(model);
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



}