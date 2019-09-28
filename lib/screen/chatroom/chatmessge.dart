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
           constraints: BoxConstraints( maxWidth: 300),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Color(0xffdcf8c6),borderRadius: BorderRadius.circular(5)),
          child:  Text(message, style: TextStyle(fontSize: 17)),
          // child: Row(

          //   children: <Widget>[
          //     Text(message, style: TextStyle(fontSize: 17)),
          //     Text('07:30',style: TextStyle(color: Colors.grey,fontSize: 10)),
          //     Icon(Icons.check, color: Colors.grey,)
          //   ],
          // ),      
        ),
      ],
    );
  }
}