import 'package:FiapEx/components/app_bar_fiap_ex.dart';
import 'package:FiapEx/components/drawer_fiap_ex.dart';
import 'package:FiapEx/models/schema.dart';
import 'package:FiapEx/services/charpie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewSchemaScreen extends StatefulWidget {
  @override
  _NewSchemaScreenState createState() => _NewSchemaScreenState();
}

class _NewSchemaScreenState extends State<NewSchemaScreen> {
  CharpieService service = CharpieService();

  var schema = SchemaModel();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("teste");
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
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
        ),
      ),
      drawer: DrawerFiapEx(
        route: '/',
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Theme.of(context).accentColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Text(
                "NOVO ESQUEMA",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nome:",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _nameController,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                        cursorHeight: 25.0,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: heightScreen * 0.05),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Descrição:",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _descriptionController,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                        cursorHeight: 25.0,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: heightScreen * 0.05),
                    width: widthScreen * 0.7,
                    height: heightScreen * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {},
                      child: Column(
                        children: [
                          Container(
                            height: heightScreen * 0.07,
                          ),
                          Icon(
                            Icons.arrow_circle_up,
                            color: Theme.of(context).primaryColor,
                            size: 80,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: heightScreen * 0.02),
                            child: Text(
                              "Click para carregar esquema",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
