import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  
  ChatMessage({this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          //width: 30,
           constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Color(0xffdcf8c6)),
          child: Text(message),      
        ),
      ],
    );
  }
}