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
      home: SnackBarTest(),
    );
  }
}

class CounterWidget  extends StatefulWidget {
  CounterWidget({Key key, this.initValue : 0}) : super(key: key);

  final int initValue;

  @override
  _CounterWidgetState createState() {
    return _CounterWidgetState();
  }

}

class _CounterWidgetState extends State<CounterWidget>{

  int _counter;

  @override
  void initState(){
    super.initState();
    _counter=widget.initValue;
    print("initState");
  }


  @override
  Widget build(BuildContext context){
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: ()=>setState(() => ++_counter,),
            child: Text('$_counter')
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}

class SnackBarTest extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context){
          return RaisedButton(
            onPressed: (){
              ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
              _state.showSnackBar(
                SnackBar(content: Text("我是SnackBar")),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}

