import 'package:FiapEx/models/robot.dart';
import 'package:FiapEx/repository/db_connection.dart';
import 'package:FiapEx/services/charpie_service.dart';
import 'package:flutter/material.dart';

class RobotForm2 extends StatefulWidget {
  @override
  _RobotForm2State createState() => _RobotForm2State();

  final List<Map<String, Object>> form;
  final CharpieService service = CharpieService();

  RobotForm2({@required this.form});
}

class _RobotForm2State extends State<RobotForm2> {
  
  var _currentField = 0;
  var _selectedOption = -1;
  var isInvalid = false;

  
  RobotModel robot = RobotModel();

  Map<String, Object> robotMap = {
    DbConnection.robotTable["idColumn"]: null,
    DbConnection.robotTable["nameColumn"]: null,
    DbConnection.robotTable["robotTypeColumn"]: null,
    DbConnection.robotTable["schemaUrlColumn"]: null,
    DbConnection.robotTable["doneColumn"]: 0
  };

  final _nameController = TextEditingController();

  void _next() {
    if (_currentField >= widget.form.length - 1) {
      _currentField = widget.form.length - 1;
    } else {
      setState(() {
        print("fofa");
        var option;
        if(widget.form[_currentField]['options'] != null){
          List options = widget.form[_currentField]['options'];
          option = options[_selectedOption];
        }
        switch (widget.form[_currentField]['field']) {
          case 'name':
            robotMap[DbConnection.robotTable["nameColumn"]] =
                _nameController.text;
            break;
          case 'robotType':
            robotMap[DbConnection.robotTable["robotTypeColumn"]] =
                option['value'];
            break;
          case 'schemaUrl':
            robotMap[DbConnection.robotTable["schemaUrlColumn"]] =
                option['value'];
            break;
          default:
        }
        isInvalid = false;
        _selectedOption = -1;
        _currentField++;
      });
    }}

    void _setInvalid() {
      setState(() {
        isInvalid = true;
      });
    }

    void _previous() {
      if (_currentField != 0) {
        setState(() {
          _selectedOption = -1;
          _currentField--;
          switch (widget.form[_currentField]['field']) {
            case 'name':
              robotMap[DbConnection.robotTable["nameColumn"]] = null;
              break;
            case 'robotType':
              robotMap[DbConnection.robotTable["robotTypeColumn"]] = null;
              break;
            case 'schemaUrl':
              robotMap[DbConnection.robotTable["schemaColumn"]] = null;
              break;
            default:
          }
        });
      }
    }

    void _onPressed(int option) {
      setState(() {
        _selectedOption = option;
      });
    }

    void _submit(int send) async{
      if (send == 1){
        robotMap[DbConnection.robotTable["idColumn"]] = await widget.service.getNextID();
        print(robotMap);
        widget.service.saveRobot(RobotModel.fromMap(robotMap));
      }
      await Navigator.of(context).pushNamed('/');
      setState(() {});
    }
  

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> fieldOptions =
          widget.form[_currentField]['options'];
      final submit =
          widget.form[_currentField]['field'] == "submit" ? true : false;
      if (fieldOptions == null && !submit) {
        return Container(
            padding: EdgeInsets.all(8.0),
            color: Theme.of(context).accentColor,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: 50,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Text(
                      widget.form[_currentField]['text'],
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
                        controller: _nameController,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        /*validator: (value) {
                        if (value.isEmpty) {
                          return "Campo inválido";
                        }
                        return null;
                      },*/
                        cursorColor: Theme.of(context).primaryColor,
                        cursorHeight: 25.0,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.328),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            _previous();
                          },
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
                          onPressed: () {
                            _next();
                          },
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
        return Container(
            padding: EdgeInsets.all(8.0),
            color: Theme.of(context).accentColor,
            width: MediaQuery.of(context).size.width,
            child: Container(
                width: 50,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Text(
                        isInvalid == false
                            ? widget.form[_currentField]['text']
                            : "${widget.form[_currentField]['text']} Selecione uma opção para prosseguir",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: 250,
                      child: ListView.builder(
                        itemCount: fieldOptions.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 15),
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
                              onPressed: () {
                                if (!submit) {
                                  _onPressed(index);
                                } else {
                                  _submit(fieldOptions[index]['value']);                  
                                }
                              },
                              color: index == _selectedOption
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () => _previous(),
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
                        (!submit)
                            ? RaisedButton(
                                onPressed: () {
                                  if (_selectedOption != -1) {
                                    _next();
                                  } else {
                                    _setInvalid();
                                  }
                                },
                                padding: EdgeInsets.all(15),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Theme.of(context).accentColor,
                                ),
                                color: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                      ],
                    )
                  ],
                )));
        } 
  }
}

