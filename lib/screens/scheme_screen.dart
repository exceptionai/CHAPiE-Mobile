import 'package:FiapEx/components/app_bar_fiap_ex.dart';
import 'package:FiapEx/components/drawer_fiap_ex.dart';
import 'package:FiapEx/models/roll_model.dart';
import 'package:FiapEx/services/row_call_service.dart';
import 'package:FiapEx/tiles/row_call_history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SchemeScreen extends StatefulWidget {

  @override
  _SchemeScreenState createState() => _SchemeScreenState();
}

class _SchemeScreenState extends State<SchemeScreen> {
  RowCallService service = RowCallService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFiapEx(
          action: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            child: Image.asset('assets/images/pendenteicone.png', height: 26),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
      )),
      floatingActionButton: FloatingActionButton(
                heroTag: "button",
                onPressed: () async {
                  await Navigator.of(context).pushNamed('/new_scheme');
                  setState(() {});
                },
                child: Icon(Icons.exposure_plus_1,color: Theme.of(context).accentColor,),
                backgroundColor: Theme.of(context).primaryColor,
              ),
      drawer: DrawerFiapEx(
        route: '/scheme',
      ),
      body: Container(
          padding: EdgeInsets.all(8.0),
          color: Theme.of(context).accentColor,
          width: MediaQuery.of(context).size.width,
          child: 
              ListView(
              children: <Widget>[
                Container(
                padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17.0),
                  child: Text(
                    "LISTAGEM DE ESQUEMAS",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              FutureBuilder<List<RollModel>>(
                future: service.getAllRowCall(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                    if(snapshot.data.length > 0){
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          return RowCallHistoryTile(rowModel: snapshot.data[index], onChanged: (){
                            setState((){});
                          });
                        }
                      );
                    }
                    return Center(child: Icon(Icons.sentiment_dissatisfied,color: Theme.of(context).primaryColor,size: 90,));
                  }
                  return Center(child:CircularProgressIndicator());
                },
              )
            ],
          )),
    );
  }
}
