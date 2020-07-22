import 'package:chat_app/components/message_card.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/group.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

class MessagesStream extends StatelessWidget {
  Firestore _firestore = Firestore.instance;
  final Group group;

  MessagesStream(this.group);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('messages')
          .where('groupId', isEqualTo: group.id)
          .orderBy('timeStamp')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        final messages = snapshot.data.documents.reversed;
        List<MessageCard> messageCards = [];
        for (var messageObject in messages) {
          Timestamp timestamp = messageObject.data['timeStamp'];
          DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
              timestamp.millisecondsSinceEpoch);
          messageCards.add(MessageCard(Message(
              message: messageObject.data['message'],
              sender: messageObject.data['sender'],
              timeStamp: timeago.format(dateTime))));
        }

        return ListView(
          padding: EdgeInsets.all(kSmallMargin),
          reverse: true,
          children: messageCards,
        );
      },
    );
  }
}
