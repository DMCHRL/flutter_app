import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 组合实例
 * 任意角度旋转子节点，执行动画过度
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
      home: TurnBoxRoute(),
    );
  }
}

class TurnBox extends StatefulWidget{

  const TurnBox({
    Key key,
    this.turns = 0,//旋转的圈数 一圈360度
    this.speed = 200,//过度动画时长
    this.child,
}):super(key :key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() {
     return _TurnBoxState();
  }
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  void initState(){
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity
    );
    _controller.value = widget.turns;
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext buildContext){
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  void didUpdateWidget(TurnBox oldWidget){
    super.didUpdateWidget(oldWidget);
    //角度变化时 执行动画
    if(oldWidget.turns != widget.turns){
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed??200),
        curve: Curves.easeOut
      );
    }
  }

}

class TurnBoxRoute extends StatefulWidget{

  @override
  _TurnBoxRouteState createState() {
     return _TurnBoxRouteState();
  }
}

class _TurnBoxRouteState extends State<TurnBoxRoute>{
  double _turns = .0;

  Widget build(BuildContext context){
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh,size: 50,),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh,size: 150,),
            ),
            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: (){
                setState(() {
                  _turns += 2;
                });
              },
            ),
            RaisedButton(
              child: Text(" 逆时针旋转1/5圈"),
              onPressed: (){
                setState(() {
                  _turns -= 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

}

