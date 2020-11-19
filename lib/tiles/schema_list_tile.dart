import 'package:FiapEx/models/schema.dart';
import 'package:flutter/material.dart';

class SchemaListTile extends StatefulWidget {
  final SchemaModel schemaModel;
  final VoidCallback onChanged;

  SchemaListTile({this.schemaModel, this.onChanged});

  @override
  @override
  _SchemaListTileState createState() => _SchemaListTileState();
}

class _SchemaListTileState extends State<SchemaListTile> {
  Widget build(BuildContext context) {
    SchemaModel schemaModel = widget.schemaModel;
    print(schemaModel);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.only(bottom: 15),
      child: Theme(
        data: Theme.of(context).copyWith(
          textTheme: TextTheme(
            subtitle1: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'GothamHTF',
            ),
          ),
        ),
        child: ListTile(
          onTap: () async {},
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${schemaModel != null ? schemaModel.name : ''}',
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text('${schemaModel.description}', style: TextStyle(fontSize: 14)),                

                ],
              ),
            ],
          ),
          leading:        
               Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset(
                        schemaModel.schemaUrl,
                        width: 70,
                        height: 70,
                      ),
                    )
              ),
      ),
    );
  }
}
