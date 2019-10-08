import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 手势识别
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
      home: _Drag(),
    );
  }
}

class GestureDetectorRoute extends StatefulWidget{

  @override
  _GestureDetectorRouteState createState() {
return _GestureDetectorRouteState();
  }
}

class _GestureDetectorRouteState extends State<GestureDetectorRoute>{
  String _operation = "No Gesture detected";

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("点击、双击、长按 Demo"),),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200,
            height: 100,
            child: Text(_operation,style: TextStyle(color: Colors.white),),
          ),
          onTap: ()=> updateText("Tap"),
          onDoubleTap: ()=> updateText("DoubleTap"),
          onLongPress: ()=> updateText("LongPress"),
        ),
      ),
    );
  }

  void updateText(String text){
    setState(() {
      _operation = text;
    });
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}


