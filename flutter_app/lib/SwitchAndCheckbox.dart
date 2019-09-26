import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 了解StatefulWidget
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
      home: Show(title: "单选框和复选框"),
    );
  }
}

class Show extends StatefulWidget {

  const Show({Key key,@required this.title}):super(key:key);
  final String title;

  @override
  _ShowState createState() {
    return _ShowState();
  }
}

class _ShowState extends State<Show>{
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
          activeColor:Colors.red,
            onChanged: (value){
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelected,
            onChanged: (value){
              setState(() {
                _checkboxSelected = value;
              });
            },
          )
        ],
      ),
    );

  }
}

