import 'package:chat_app/constants.dart';
import 'package:chat_app/models/group.dart';
import 'package:chat_app/utils/auth_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InputMessageBar extends StatefulWidget {
  final Group group;

  InputMessageBar(this.group);

  @override
  _InputMessageBarState createState() => _InputMessageBarState();
}

class _InputMessageBarState extends State<InputMessageBar> {
  Firestore _firestore = Firestore.instance;

  String message = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            controller: controller,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColorDark
                    )
                ),
            ),
            onChanged: (value) {
              message = value.trim();
            },
            onSubmitted: (value) {
              addMessage();
              controller.clear();
            },
          ),
        ),
        SizedBox(
          width: kLargeMargin,
        ),
        OutlineButton(
          focusColor: Colors.blue,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          disabledBorderColor: Theme.of(context).primaryColorDark,
          highlightedBorderColor: Theme.of(context).primaryColorDark,
          child: Text('Send'),
          onPressed: () {
            addMessage();
            controller.clear();
          },
        )
      ],
    );
  }

  Future<DocumentReference> addMessage() {
    return _firestore.collection('messages').add({
            'groupId': widget.group.id,
            'message': message,
            'sender': AuthUtils.firebaseUser.email,
            'timeStamp': Timestamp.now()
          });
  }
}
