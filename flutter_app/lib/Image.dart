import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 了解图片
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
      home: Show(title: "图片"),
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
            Image1(),
            //FlatButton(child: Text("ss"),),
          ],
        )
    );
  }
}


class Image1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://i0.hdslb.com/bfs/album/c45be4e9ba73122770e688be75ab00a43d65b73b.jpg",
          width: 400,
      height: 400,
    );
  }
}


