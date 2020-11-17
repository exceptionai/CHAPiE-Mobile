import 'package:flutter/material.dart';

class RobotForm extends StatelessWidget {
  final String textField;
  final List<Map<String, Object>> fieldOptions;
  final void Function() next;
  final void Function() previous;

  RobotForm({
    @required this.textField,
    @required this.fieldOptions,
    @required this.next,
    @required this.previous,
  });

  @override
  Widget build(BuildContext context) {
    print(textField);
    if (fieldOptions == null) {
      return Container(
          padding: EdgeInsets.all(8.0),
          color: Theme.of(context).accentColor,
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: 50,
            margin: EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  child: Text(
                    textField,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                      textAlign: TextAlign.center,
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
                  margin: EdgeInsets.only(top: 360),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: previous,
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
                        onPressed: next,
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
              margin: EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  Container(
                    height:60,
                    child: Text(
                      textField,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 60,
                  ),
                  SizedBox(                   
                    height: 400,
                    width: 250,                    
                    child: ListView.builder(
                      itemCount: fieldOptions.length,
                      itemBuilder: (context, index) {
                        print(fieldOptions[index]['text']);
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
                            onPressed: () {},
                            color: Theme.of(context).primaryColor,                          
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: previous,
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
                        onPressed: next,
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
