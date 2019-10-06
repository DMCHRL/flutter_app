import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 *  变换
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
      home: TransformRoute(),
    );
  }
}

class TransformRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
      ),
      body: Padding(padding: EdgeInsets.all(80),
          child:Container(
            color: Colors.black,
            child: new Transform(
              alignment: Alignment.topRight,
              transform: new Matrix4.skewY(0.3),
              child: new Container(
                padding: const EdgeInsets.all(8),
                color: Colors.deepOrange,
                child: const Text("Aparttmenr for rent"),
              ),
            ),
          ),
      )
    );
  }
}

