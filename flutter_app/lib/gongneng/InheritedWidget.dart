import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 数据共享
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
      home: InheritedWidgetRoute(),
    );
  }
}

class ShareDataWidget extends InheritedWidget{

  final int data; //需要在子树中共享的数据

  ShareDataWidget({
    @required this.data,
    Widget child
  }):super(child :child);

  //定义一个方法 方便子树中的Wiget获取共享数据
  static ShareDataWidget of(BuildContext context){
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  bool updateShouldNotify(ShareDataWidget old){

    //返回true会调用子widget的didChangeDependencies
    return old.data != data;
  }

}

//实现一个子组件
class _TestWiget extends StatefulWidget{

  @override
  _TestWigetState createState() {
    return _TestWigetState();
  }
}

class _TestWigetState extends State<_TestWiget>{

  Widget build(BuildContext context){
    return Text(ShareDataWidget.of(context).data.toString());
  }

  void didChangeDependencies(){
    super.didChangeDependencies();
    print("Dependencies change");
  }
}
//创建一个按钮

class InheritedWidgetRoute extends StatefulWidget{

  @override
  InheritedWidgetRouteState createState() {
    return InheritedWidgetRouteState();
  }
}

class InheritedWidgetRouteState extends State<InheritedWidgetRoute>{

  int count = 0;

  Widget build(BuildContext context){
    return Material(
      child: Center(
        child: ShareDataWidget(
            data:count,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _TestWiget(), //子widget中依赖ShareDataWidget
                ),
                RaisedButton(
                  child: Text("Increment"),
                  //每点击一次，将count自增，然后重新build，ShareDataWidget的data将被更新
                  onPressed: () => setState(() => ++count),
                )
              ],
            ),
        )
      ),
    );
  }
}
