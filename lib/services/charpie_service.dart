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

  Future<List<SchemaModel>> getAllSchemas() async{
    List<SchemaModel> rows = await schemaRepository.getAll();
    return rows;
  }

  getNextID() async {
     int id = await robotRepository.getNextID();
     return id;
   }

  Future<RobotModel> saveRobot(RobotModel model) async {
    return robotRepository.save(model);
  }



}