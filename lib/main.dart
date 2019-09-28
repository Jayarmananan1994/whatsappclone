import 'package:flutter/material.dart';
import 'package:whatsapp/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsappClone',
      theme: ThemeData(
       // primarySwatch: Colors.teal,
        primaryColor:Color(0xff075e54)
      ),
      home: HomePage(),
    );
  }
}
