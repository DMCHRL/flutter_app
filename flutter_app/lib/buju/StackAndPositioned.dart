import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * StackAndPositioned
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
      home: StackRoute(),
    );
  }
}

class StackRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack和绝对定位"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,//未定位的widget占满stack整个空间
          children: <Widget>[
            Positioned(
              left: 18.0,
              top: 18,
              child: Text("I am Jack"),
            ),
            Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),

            Positioned(
              top: 18,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}

