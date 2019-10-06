import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 导航返回拦截
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
      home: WillPopScopeRoute(),
    );
  }
}

class WillPopScopeRoute extends StatefulWidget{


  @override
  WillPopScopeRouteState createState() {
    return WillPopScopeRouteState();
  }
}

class WillPopScopeRouteState extends State<WillPopScopeRoute>{
  DateTime _lastPressedAt;

  Widget build(BuildContext context){
    return Material(
      child: new WillPopScope(

          onWillPop: () async{
            if(_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)){
              print("即将退出222");
              _lastPressedAt = DateTime.now();
              return false;
            }
            print("即将退出");
            return true;
          },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ),
      ),


    );
  }
}

