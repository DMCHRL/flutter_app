import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 进度条
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
      home: ProgressIndicator1(),
    );
  }
}

class ProgressIndicator1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProgressIndicator Demo"),
      ),
      body: Column(
        children: <Widget>[
          Text("线性模糊进度条"),
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          Text("线性清晰进度条"),
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
          Text("圆形模糊进度条"),
          CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          Text("圆形清晰进度条"),
          CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
          //指定高度
          Text("指定线性进度条高度"),
          SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
          )
        ],
      ),
    );
  }
}

