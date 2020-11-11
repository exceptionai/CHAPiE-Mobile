import 'package:flutter/material.dart';

class AppBarFiapEx extends StatelessWidget implements PreferredSizeWidget{
  
  final Widget action;
  const AppBarFiapEx({Key key, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
         backgroundColor: Theme.of(context).accentColor,
         elevation: 0, 
         centerTitle: true,
         iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
         actions: [
           action,
           
         ],
         title: Row(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text('CHAPPiE',style: TextStyle(color: Colors.white,fontSize: 35,),),

           ],
         ),
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}