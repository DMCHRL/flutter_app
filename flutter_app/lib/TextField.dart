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
      home: FocusTestRoute(title: "文本框"),
    );
  }
}

/**
 * 文本框
 */
class Show extends StatefulWidget {

  Show({Key key,@required this.title}):super(key:key);
  final String title;

  @override
  _ShowState createState() {
    return _ShowState();
  }
}

class _ShowState extends State<Show> {
  TextEditingController _unameController = TextEditingController();

  @override
  void initState() {
    _unameController.text="hello world";
    _unameController.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _unameController.text.length
    );
    //监听输入改变
    _unameController.addListener((){
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[

          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
            ),
            controller: _unameController,
            textInputAction:TextInputAction.search,
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

/**
 * 焦点
 */
class FocusTestRoute extends StatefulWidget{
  FocusTestRoute({Key key,@required this.title}):super(key:key);
  final String title;

  @override
  _FocusTestRouteState createState() {
    return _FocusTestRouteState();
  }
}

class _FocusTestRouteState extends State<FocusTestRoute>{
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
             focusNode: focusNode1,
            decoration: InputDecoration(
                labelText: "input1"
            ),
          ),
          TextField(
             focusNode: focusNode2,//关联focusNode2
            decoration: InputDecoration(
                labelText: "input2"
            ),
          ),
          Builder(builder:(ctx){
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: (){
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}