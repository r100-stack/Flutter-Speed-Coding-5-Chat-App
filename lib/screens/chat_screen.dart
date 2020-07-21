import 'package:chat_app/components/input_message_bar.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static final String routeName = '/chats';
  final Group group;

  ChatScreen(this.group);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Firestore _firestore = Firestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: Column(
        children: <Widget>[
//          StreamBuilder(
//            stream: _firestore.collection('messages').where('groupId', ),
//          )
          Padding(
            padding: EdgeInsets.all(kSmallMargin),
            child: InputMessageBar(),
          )
        ],
      ),
    );
  }
}
