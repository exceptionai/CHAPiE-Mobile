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

  /*
  Future<List<ClassModel>> getAllClasses() async{
    return await classRepository.getAllClasses();
  }

  Future<List<DisciplineModel>> getAllDisciplinesByClass({int classId}) async{
    return await disciplineRepository.getAllDisciplinesByClass(classId: classId);
  }

  Future<bool> finishRowCall({int rowCallId, DateTime date}) async{
    int updatedId = await repository.finishRowCall(rowCallId:rowCallId, date: date.toIso8601String());
    if(updatedId != null){
      return true;
    }
    return false;
  }

  Future<bool> setPresence(bool presence, {int studentId, int rowCallId}) async{
    bool successful = await rollRegisterRepository.saveRollRegister(rowCallId, studentId, presence);
    return successful;
  }

  Future<List<int>> getPresentStudents({@required int rowCallId, int studentId}) async{
    return await rollRegisterRepository.getPresenceStudent(1, rowCallId: rowCallId);
  }

  Future<List<int>> getAbsentStudents({@required int rowCallId, int studentId}) async{
    return await rollRegisterRepository.getPresenceStudent(0, rowCallId: rowCallId);
  }

  Future<RollModel> createRowCall(RollModel rowCallModel) async{
     ClassModel classRow = await classRepository.getClass(rowCallModel.idClass);
     DisciplineModel disciplineRow = await disciplineRepository.getDiscipline(rowCallModel.idDiscipline);
    List<StudentModel> students = await studentRepository.getAllStudentsByClass(rowCallModel.idClass);

    rowCallModel.students = students;
    rowCallModel.presentStudents = 0;
    rowCallModel.absentStudents = 0;
    rowCallModel.studentClass = classRow;
    rowCallModel.discipline = disciplineRow;   
    RollModel model = await repository.saveRoll(rowCallModel);
    return model;
  }
  */
}