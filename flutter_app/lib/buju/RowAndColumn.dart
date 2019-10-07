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
      home: RowAndColumn2(),
    );
  }
}

class RowAndColumn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RowAndColumn Demo"),
      ),
      body: Column(
        //纵轴方向对齐方式
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            //横轴对齐方式
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            //表示Row在主轴(水平)方向占用的空间
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(" hello world ", style: TextStyle(fontSize: 30.0),),
              Text(" I am Jack "),
            ],
          ),
        ],
      ),
    );
  }
}

class CenterColumn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("hi"),
        Text("hello")
      ],
    );
  }
}

class ConstrainedBoxRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("hi"),
          Text("world"),
        ],
      ),
    );
  }
}

/**
 * 如果Row里面嵌套Row，或者Column里面再嵌套Column，那么只有对最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小，
 * 如果要让里面的Column占满外部Column，可以使用Expanded 组件
 */
class RowAndColumn2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RowAndColumn Demo"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


