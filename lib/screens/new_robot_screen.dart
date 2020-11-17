import 'package:FiapEx/components/app_bar_fiap_ex.dart';
import 'package:FiapEx/components/drawer_fiap_ex.dart';
import 'package:FiapEx/components/robot_form_ex.dart';
import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/services/charpie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewRobotScreen extends StatefulWidget {
  @override
  _NewRobotScreenState createState() => _NewRobotScreenState();
}

class _NewRobotScreenState extends State<NewRobotScreen> {
  CharpieService service = CharpieService();

  final _form = const [
    {
      'text': 'Qual será o nome do robô?'
    },
    {
      'text': 'Qual será o tipo do robô?',
      'options': [
        {'text': 'Android', 'value': 'android'},
        {'text': 'Babysister', 'value': 'babysyster'},
        {'text': 'Military', 'value': 'military'},
        {'text': 'Worker', 'value': 'worker'}
      ],
    },
    {
      'text': 'Selecione um esquema para manufatura do robô?',
      'options': [
        {'text': 'Ousadasso', 'value' : 'ousadasso'},
        {'text': 'Super ousadao', 'value' : 'super ousado'},
        {'text': 'Cuzudo', 'value' : 'cuzudo'},
        {'text': 'Upload de esquema','value' : 'upload'},
      ],
    },
    {
      'text': 'Deseja concluir a construção?',
      'options': [
        {'text': 'Sim', 'value' : 1},
        {'text': 'Não', 'value' : 0},
      ],
    },
  ];
  
  var _currentField = 0;
  var _robot = RobotModel();

  void _next(){
      setState(() {
        if(_currentField >= _form.length - 1){
          _currentField = _form.length - 1;
        }else{
           _currentField ++;
        }
      });
    }

    void _previous(){
      setState(() {
        if(_currentField != 0){
          _currentField --;
        }
          
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarFiapEx(
            action: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child:
                Image.asset('assets/images/entregatrabalhos.png', height: 26),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/scheme');
            },
          ),
        )),
        drawer: DrawerFiapEx(
          route: '/',
        ),
        body: RobotForm(
        textField: _form[_currentField]['text'],
        fieldOptions: _form[_currentField]['options'],
        next: _next,
        previous: _previous),
      );
  }
}
