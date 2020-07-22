import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/utils/auth_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  MessageCard(this.message);

  @override
  Widget build(BuildContext context) {
    bool isMe = AuthUtils.firebaseUser.email == message.sender;

    TextStyle textStyle = TextStyle(color: isMe ? Colors.white : Colors.black);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: kSmallMargin / 2),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Wrap(
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .7),
                padding: EdgeInsets.all(kSmallMargin),
                decoration: BoxDecoration(
                  color: isMe
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isMe ? kLargeMargin : 0),
                      topRight: Radius.circular(isMe ? 0 : kLargeMargin),
                      bottomLeft: Radius.circular(kLargeMargin),
                      bottomRight: Radius.circular(kLargeMargin)),
                ),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      message.message,
                      style: textStyle,
                    ),
                    SizedBox(
                      height: kSmallMargin,
                    ),
                    Text(
                      '${message.sender}',
                      style: textStyle,
                    ),
                    Text(
                      message.timeStamp,
                      style: textStyle,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
