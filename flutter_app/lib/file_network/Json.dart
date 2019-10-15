import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

/**
 *
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JsonRoute(),
    );
  }
}

class JsonRoute extends StatelessWidget{

 static String jsonStr ='[{"name":"Jack"},{"name":"Rose"}]';
  List items=json.decode(jsonStr);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(padding: EdgeInsets.only(top: 200),
      child:Text(items[0]["name"]),
      ),
    );
  }
}

