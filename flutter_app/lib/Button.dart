import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 了解按钮
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
      home: Show(title: "按钮"),
    );
  }
}

class Show extends StatelessWidget {

  const Show({Key key,@required this.title}):super(key:key);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Text(title),
      ),
      body: new Column(
        children: <Widget>[
          Button1(),
          Button2(),
          Button3(),
          Button4(),
          Button5(),
          Button6(),
          Button7(),
        ],
      )
    );
  }
}

//RaisedButton
class Button1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("normal"),
      onPressed: (){},
    );
  }
}

class Button2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("normal"),
      onPressed: (){},
    );
  }
}

class Button3 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text("normal"),
      onPressed: (){},
    );
  }
}

//IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
class Button4 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.thumb_down),
      onPressed: () {},
    );
  }
}

//RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮
class Button5 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.send),
      label: Text("发送"),
      onPressed: (){},
    );
  }
}
class Button6 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      icon: Icon(Icons.fingerprint),
      label: Text("指纹识别"),
      onPressed: (){},
    );
  }
}

//自定义按钮
class Button7 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      highlightColor: Colors.blue[700],
      colorBrightness: Brightness.dark,
      splashColor: Colors.grey,
      child: Text("Submit"),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {},
    );
  }
}

