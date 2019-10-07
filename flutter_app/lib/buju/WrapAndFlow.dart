import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 线性布局
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.red,
    ),
      home: RowAndColumn(),
    );
  }
}

class RowAndColumn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WrapAndFlow Demo"),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing:100,
            runSpacing: 1,
            alignment: WrapAlignment.center,
            children: <Widget>[
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Hamilton'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                label: new Text('Lafayette'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                label: new Text('Mulligan'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                label: new Text('Laurens'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
