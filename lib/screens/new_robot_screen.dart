import 'package:FiapEx/components/app_bar_fiap_ex.dart';
import 'package:FiapEx/components/drawer_fiap_ex.dart';
import 'package:FiapEx/components/robot_form_ex_statelful.dart';
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
  var robot = RobotModel();

  @override
  Widget build(BuildContext context) {
  final schemas =  service.getAllSchemas();
  final _form = const [
    {
      'text': 'Qual será o nome do robô?',
      'field' : 'name',
    },
    {
      'text': 'Qual será o tipo do robô?',
      'field' : 'robotType',
      'options': [
        {'text': 'Android', 'value': 'android'},
        {'text': 'Babá', 'value': 'babysyster'},
        {'text': 'Operário', 'value': 'military'},
        {'text': 'Militar', 'value': 'worker'}
      ],
    },
    {
      'text': 'Selecione um esquema para manufatura do robô?',
      'field' : 'schemaUrl',
      'options': [
        {'text': 'Android', 'value' : 'assets/images/android.jpg'},
        {'text': 'Babá', 'value' : 'assets/images/baby-syster.jpg'},
        {'text': 'Operário', 'value' : 'assets/images/worker.jpg'},
        {'text': 'Militar','value' : 'assets/images/military.jpg'},
      ],
    },
    {
      'text': 'Quantos gostaria de construir?',
      'field' : 'quantity',
    },
    {
      'text': 'Deseja concluir a construção?',
      'field' : 'submit',
      'options': [
        {'text': 'Sim', 'value' : 1},
        {'text': 'Não', 'value' : 0},
      ],
    },
    
  ];

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
        body: RobotForm2(form:_form),
      );
  }
}
