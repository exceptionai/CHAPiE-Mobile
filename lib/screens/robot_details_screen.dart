import 'package:FiapEx/components/app_bar_fiap_ex.dart';
import 'package:FiapEx/components/drawer_fiap_ex.dart';
import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/services/charpie_service.dart';
//import 'package:FiapEx/tiles/robot_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RobotDetailsScreen extends StatefulWidget {
  final RobotModel robotModel;

  RobotDetailsScreen({this.robotModel});

  @override
  _RobotDetailsScreenState createState() => _RobotDetailsScreenState();
}

class _RobotDetailsScreenState extends State<RobotDetailsScreen> {
  CharpieService service = CharpieService();


  confirmSelfDestruction(){
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Auto Destuição',style: TextStyle(color: Theme.of(context).primaryColor),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), topLeft: Radius.circular(15))),
        content: 
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Deseja que o robô ${widget.robotModel.name} se auto destrua?', style: TextStyle(color: Colors.white),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(child: Text('Sim', style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 18)),onPressed: (){
                    selfDestruct();
                    },),
                  FlatButton(child: Text('Não', style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 18)),onPressed: (){Navigator.of(context).pop();},),
                ],
              ),
              
            ],
          ),
        elevation: 24,
        
      ),
      barrierDismissible: true);
  
  }

  selfDestruct() async{
    service.selfDestruct(widget.robotModel.getServiceId());
    await Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBarFiapEx(
          action: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Icon(Icons.arrow_left),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      )),
      floatingActionButton: FloatingActionButton(
        heroTag: "button",
        onPressed: () async {
          confirmSelfDestruction();
        },
        
        child: Image.asset('assets/images/bomb-detonation.png'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: DrawerFiapEx(
        route: '/',
      ),
      body: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
          color: Theme.of(context).accentColor,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nome:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Container(
                          height: heightScreen * 0.01,
                        ),
                        Text(
                          "Tipo:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Container(
                          height: heightScreen * 0.01,
                        ),
                        Text(
                          "Função:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Container(
                          height: heightScreen * 0.01,
                        ),
                      ],
                    ),
                    Container(
                      width: widthScreen * 0.07,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.robotModel.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Container(
                          height: heightScreen * 0.01,
                        ),
                        Text(
                          widget.robotModel.robotType,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Container(
                          height: heightScreen * 0.01,
                        ),
                        Text(
                          "Travar batalhas",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Container(
                          height: heightScreen * 0.01,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: heightScreen * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(bottom: widthScreen * 0.1),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
                child: Image.asset(
                  widget.robotModel.schemaUrl,
                  width: widthScreen * 0.7,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: widthScreen * 0.17,
                        lineWidth: 2.0,
                        percent: 1,
                        center: new Text("100%"),
                        progressColor: Theme.of(context).primaryColor,
                      ),
                      Container(width: widthScreen * 0.02,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sociabilidade",
                            style: TextStyle(
                              fontSize: 20,
                              color:Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "Boa praça!",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: heightScreen * 0.01,
                    width: 0,
                  ),
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: widthScreen * 0.17,
                        lineWidth: 3.0,
                        percent: 0.25,
                        center: new Text("25%"),
                        progressColor: Colors.red,
                      ),
                      Container(width: widthScreen * 0.02,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Agressividade",
                            style: TextStyle(
                              fontSize: 20,
                              color:Colors.red,
                            ),
                          ),
                          Text(
                            "Boa vizinhança!",
                            style: TextStyle(
                              fontSize: 12,
                            ),                          
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: heightScreen * 0.01,
                    width: 0,
                  ),
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: widthScreen * 0.17,
                        lineWidth: 3.0,
                        percent: 1.0,
                        center: new Text("250%"),
                        progressColor: Colors.blue,
                      ),
                      Container(width: widthScreen * 0.02,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Comunicação",
                            style: TextStyle(
                              fontSize: 20,
                              color:Colors.blue,
                            ),
                          ),
                          Text(
                            "Fala bem!",
                            style: TextStyle(
                              fontSize: 12,
                            ),                          
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: heightScreen * 0.01,
                    width: 0,
                  ),
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: widthScreen * 0.17,
                        lineWidth: 3.0,
                        percent: 0.7,
                        center: new Text("70%"),
                        progressColor: Colors.yellow,
                      ),
                      Container(width: widthScreen * 0.02,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Apego",
                            style: TextStyle(
                              fontSize: 20,
                              color:Colors.yellow,
                            ),
                          ),
                          Text(
                            "companheiro do humano!",
                            style: TextStyle(
                              fontSize: 12,
                            ),                          
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
