import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 尺寸限制容器类
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
      home: ConstrainedBoxRoute(),
    );
  }
}

class ConstrainedBoxRoute extends StatelessWidget{

  Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 50,
        ),
        child: Container(
          height: 5,
          child: redBox,
        ),
      ),
    );
  }
}

