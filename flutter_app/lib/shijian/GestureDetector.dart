import 'package:flutter/gestures.dart';
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
      home: _GestureRecognizerTestRoute(),
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

//滑动
class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A"),backgroundColor: Colors.red,),
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
      ),
    );
  }
}

//单一方向滑动
class _DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() => new _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              }
          ),
        )
      ],
    );
  }
}

//缩放
class _ScaleTestRoute extends StatefulWidget{

  @override
  _ScaleTestRouteState createState() {
    return _ScaleTestRouteState();
  }
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Material(
      child:  Center(
        child: GestureDetector(
          //指定宽度，高度自适应
          child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1570609672216&di=835358357451414e52c9fa9e35d8b021&imgtype=0&src=http%3A%2F%2Fpic22.nipic.com%2F20120725%2F9676681_001949824394_2.jpg", width: _width),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width=200*details.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}

//点击文本变色
class _GestureRecognizerTestRoute extends StatefulWidget{

  @override
  _GestureRecognizerTestRouteState createState() {
    return _GestureRecognizerTestRouteState();
  }
}

class _GestureRecognizerTestRouteState extends State<_GestureRecognizerTestRoute>{
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  void dispose(){
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return Material(
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
            TextSpan( text: "你好世界"),
            TextSpan( text: "点我变色",style: TextStyle(fontSize: 30,color: _toggle? Colors.blue:Colors.red),
              recognizer: _tapGestureRecognizer..onTap = (){
                setState(() {
                  _toggle = !_toggle;
                });
              },
            ),
            TextSpan( text: "你好世界"),
            ],
          ),
        ),
      ),
    );
  }
}






