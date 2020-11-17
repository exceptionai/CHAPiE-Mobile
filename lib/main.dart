import 'package:FiapEx/screens/login_screen.dart';
import 'package:FiapEx/screens/robot_list_screen.dart';
import 'package:flutter/material.dart';

import 'screens/new_robot_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fiap Ex',
      theme: ThemeData(
        textTheme:  TextTheme(
         bodyText1: TextStyle(color: Colors.white),
         bodyText2: TextStyle(color: Colors.white,fontSize: 20),
         
        ),
        
        primaryColor: const Color(0xff47ffe7),
        accentColor: const Color(0xff151819),
        fontFamily: 'GothamHTF',
        hintColor: Colors.white,
      
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name) {

          case '/':
            return MaterialPageRoute(
              builder: (_) => RobotListScreen(),
              settings: settings,
            );

          case '/login':
            return MyCustomRoute(
              builder: (_) => LoginScreen(),
              settings: settings
            );

          case '/new':
          return MyCustomRoute(
            builder: (_) => NewRobotScreen(),
            settings: settings
          );
        
          default: 
            return null;
        }
      },
      initialRoute: '/login'
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/login') return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
