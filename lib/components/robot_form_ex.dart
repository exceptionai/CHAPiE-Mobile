import 'package:FiapEx/models/robot.dart';
import 'package:flutter/material.dart';

class RobotForm extends StatelessWidget {
  final String textField;
  final List<Map<String, Object>> fieldOptions; 
  final void Function(Map<String,Object>) next;
  final void Function(Map<String,Object>) previous;
  final void Function(int) onPressed;
  final int selectedOption;

  RobotForm({
    @required this.textField,
    @required this.fieldOptions,
    @required this.next,
    @required this.previous,
    @required this.onPressed,
    @required this.selectedOption
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    if (fieldOptions == null) {
      return Container(
          padding: EdgeInsets.all(8.0),
          color: Theme.of(context).accentColor,
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: 50,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Text(
                    textField,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: nameController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Campo inválido";
                        }
                        return null;
                      },
                      cursorColor: Theme.of(context).primaryColor,
                      cursorHeight: 25.0,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.328),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () => previous({'value':'','field' : 'name'}),
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Theme.of(context).accentColor,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      Container(
                        width: 50,
                      ),
                      RaisedButton(
                        onPressed: () => next({'value':nameController.text,'field' : 'name'}),
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Theme.of(context).accentColor,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    } else {
      var i;
      return Container(
          padding: EdgeInsets.all(8.0),
          color: Theme.of(context).accentColor,
          width: MediaQuery.of(context).size.width,
          child: Container(
              width: 50,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                      textField,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(                   
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: 250,                    
                    child: ListView.builder(
                      itemCount: fieldOptions.length,
                      itemBuilder: (context, index) {
                        i = index;
                        return Container(
                          margin: EdgeInsets.only(top:15),
                          child: RaisedButton(                               
                            padding: EdgeInsets.all(15),                                                   
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              fieldOptions[index]['text'],
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            
                            onPressed:() {
                                onPressed(index);
                            }
                            ,
                            color: index == selectedOption ? Colors.white :  Theme.of(context).primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () => previous({'value': null}),
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Theme.of(context).accentColor,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      Container(
                        width: 50,
                      ),
                      RaisedButton(
                        onPressed: () => next(fieldOptions[i]),
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Theme.of(context).accentColor,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),
                ],
              )));
    }
  }
}
