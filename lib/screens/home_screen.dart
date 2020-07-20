import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(kLargeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Image(
                  height: 250,
                  image: AssetImage('images/logo.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Chat with your ",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  width: kSmallMargin,
                ),
                Expanded(
                  child: RotateAnimatedTextKit(
                    repeatForever: true,
                    text: ["FRIENDS", "FAMILY"],
                    textStyle: TextStyle(fontSize: 40.0),
                  ),
                ),
              ],
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              splashColor: Theme.of(context).accentColor,
              child: Text('LOGIN', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.pushNamed(context, AuthScreen.routeName, arguments: true);
              },
            ),
            OutlineButton(
              color: Theme.of(context).accentColor,
              splashColor: Theme.of(context).accentColor,
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
                width: 2
              ),
              onPressed: () {
                Navigator.pushNamed(context, AuthScreen.routeName, arguments: false);
              },
              focusColor: Colors.red,
              highlightedBorderColor: Theme.of(context).primaryColor,
              child: Text('REGISTER'),
            )
          ],
        ),
      ),
    );
  }
}
