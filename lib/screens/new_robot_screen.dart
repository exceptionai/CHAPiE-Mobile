import 'package:FiapEx/components/app_bar_fiap_ex.dart';
import 'package:FiapEx/components/drawer_fiap_ex.dart';
import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/services/charpie_service.dart';
import 'package:FiapEx/tiles/robot_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewRobotScreen extends StatefulWidget {

  @override
  _NewRobotScreenState createState() => _NewRobotScreenState();
}

class _NewRobotScreenState extends State<NewRobotScreen> {
  CharpieService service = CharpieService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFiapEx(
        action: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Image.asset('assets/images/entregatrabalhos.png', height: 26),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/scheme');
          },
        ),
      )),
      drawer: DrawerFiapEx(
        route: '/',
      ),
      body: Container(
          padding: EdgeInsets.all(8.0),
          color: Theme.of(context).accentColor,
          width: MediaQuery.of(context).size.width,
          child: Container(
            width:  50,
            margin: EdgeInsets.only(top: 220.0),
            child: Column (
              children: [
                Text("Como gostaria de chamar seu robô"),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor), 
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,                      
                    ),
                    validator: (value) {
                      if(value.isEmpty) {
                        return "Campo inválido";
                      }
                      return null;
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    cursorHeight: 25.0,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      
                    )
                  ),
                ),
            ],),
          )
              
    ));
  }
}
