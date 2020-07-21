import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/groups_screen.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          HomeScreen.routeName: (context) => HomeScreen(),
          AuthScreen.routeName: (context) => AuthScreen(settings.arguments),
          GroupsScreen.routeName: (context) => GroupsScreen(),
          ChatScreen.routeName: (context) => ChatScreen(settings.arguments)
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      theme: ThemeData(
        primaryColor: Colors.indigo,
        primaryColorDark: Colors.indigo[700],
        accentColor: Colors.lightGreenAccent
      ),
    );
  }
}
