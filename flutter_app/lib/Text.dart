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
      home: Show(title: "文本及样式"),
    );
  }
}

class Show extends StatelessWidget {

  const Show({Key key,@required this.title}):super(key:key);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Text(title),
      ),
      body: new Column(
        children: <Widget>[
          Text1(),
          Text2(),
          Text3(),
        ],
      )
    );
  }
}

class Text1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello world",
      textAlign: TextAlign.left,
    );
  }
}

class Text2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Text("Hello world! I'm Jack. "*4,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class Text3 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Text("Hello world",
      textScaleFactor: 1.5,
    );
  }
}


