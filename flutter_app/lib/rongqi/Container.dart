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
      home: ContainerRoute(),
    );
  }
}

class ContainerRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 120),
        constraints: BoxConstraints.tightFor(width: 200,height: 200),//限制大小
        decoration: BoxDecoration( //背景装饰
          gradient: RadialGradient(
            colors: [Colors.red,Colors.orange],
            center: Alignment.topCenter,
            radius: 0.98,
          ),
          boxShadow: [ //阴影
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2, 2),
              blurRadius: 4.0,
            )
          ]
        ),
        transform: Matrix4.rotationZ(.2), //卡片倾斜
        alignment: Alignment.center, //文字居中
        child: Text("5.20",style: TextStyle(color: Colors.white,fontSize: 40),),
      )
    );
  }
}

