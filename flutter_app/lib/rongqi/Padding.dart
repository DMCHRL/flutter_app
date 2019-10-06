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
      home: PaddingRoute(),
    );
  }
}

class PaddingRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text("hello world"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("I am jack"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text("Your friend"),
            ),
          ],
        ),
      ),
    );
  }
}

