import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 *ClipOval	子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
 * ClipRRect	将子组件剪裁为圆角矩形
 * ClipRect	剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
 *
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
      home: ClipRoute(),
    );
  }
}

class ClipRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.network( "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
      width: 80,);

    return Scaffold(
      appBar: AppBar(
        title: Text("Clip Demo"),
      ),
      body: Column(
        children: <Widget>[
          avatar,
          ClipOval(child: avatar,),
          ClipRRect( //剪成圆角矩形
            borderRadius: BorderRadius.circular(25),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatar,
              ),
              Text("hello world",style: TextStyle(color: Colors.green),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(//将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,///
                  widthFactor: .5,
                  child: avatar,
                ),
              ),
              Text("hello world",style: TextStyle(color: Colors.green),)
            ],
          )
        ],
      )
    );
  }
}

