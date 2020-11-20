import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/screens/robot_details_screen.dart';
import 'package:flutter/material.dart';


class RobotListTile extends StatefulWidget {

  final RobotModel robotModel;
  final VoidCallback onChanged;

  RobotListTile(
    {this.robotModel, this.onChanged});

  @override
  @override
  _RobotListTileState createState() => _RobotListTileState();

}

class _RobotListTileState extends State<RobotListTile> {

  Widget build(BuildContext context) {
    RobotModel robotModel = widget.robotModel;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.only(bottom: 15),
      child: Theme(
        data: Theme.of(context).copyWith(textTheme: TextTheme(
          subtitle1:  TextStyle(color: Colors.white,fontSize: 20,
          fontFamily: 'GothamHTF',),
        ),),
              child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RobotDetailsScreen(robotModel: widget.robotModel,))
            );
          },
          title: Column(            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${robotModel != null ? robotModel.name : ''}',
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text('Tipo: ', style: TextStyle(fontSize: 14)),
                  Text('${robotModel.robotType}', style: TextStyle(fontSize: 16)),
                ],
              ),
              
            ],
          ),
          leading: 
             widget?.robotModel?.done != null && widget.robotModel.done == 0 ? Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Image.asset(
                    'assets/images/presenteicone.png',
                    width: 40,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    'assets/images/pendenteicone.png',
                    width: 40,
                  ),
                ),
        ),
      ),
    );
  }
}

