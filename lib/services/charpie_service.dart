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

  getNextID() async {
     int id = await repository.getNextID();
     return id;
   }

  Future<RobotModel> saveRobot(RobotModel model) async {
    return repository.save(model);
  }



}