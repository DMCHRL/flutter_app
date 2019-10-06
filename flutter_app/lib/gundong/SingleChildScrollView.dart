import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 不支持延迟
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
      home: SingleChildScrollViewRoute(),
    );
  }
}

class SingleChildScrollViewRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("Clip Demo"),
      ),
      body:Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children:str.split("").map((c) => Text(c,textScaleFactor: 2.0,)).toList(),
            ),
          ),
        ),
      )
    );
  }
}

