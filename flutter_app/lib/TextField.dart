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
      home: Show(title: "文本框"),
    );
  }
}

class Show extends StatelessWidget {

  Show({Key key,@required this.title}):super(key:key);
  final String title;

  TextEditingController _unameController = TextEditingController();

  @override
  void initState() {
    //监听输入改变
    _unameController.addListener((){
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
          keyboardType:TextInputType.phone,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
            ),
            controller: _unameController,
          /*  onChanged: (V){
              print(_unameController.text);
            },*/
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }


}

