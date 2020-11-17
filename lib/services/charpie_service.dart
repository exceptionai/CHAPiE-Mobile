//SERVIRA PARA CONSOLIDAR TODAS AS INFORMAÇÕES//
import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/repository/robot_repository.dart';

class CharpieService{
  
  RobotRepository repository = RobotRepository();
  /*adicionar restantes dos repositorios*/
  
  Future<List<RobotModel>> getAllRobots() async{
    List<RobotModel> rows = await repository.getAll();
    return rows;
  }


}