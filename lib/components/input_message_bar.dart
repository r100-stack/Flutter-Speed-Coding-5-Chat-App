import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class InputMessageBar extends StatefulWidget {
  @override
  _InputMessageBarState createState() => _InputMessageBarState();
}

class _InputMessageBarState extends State<InputMessageBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
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
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColorDark
                    )
                )
            ),
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
          onPressed: () {},
        )
      ],
    );
  }
}
