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
//      theme: ThemeData(
//      primarySwatch: Colors.red,
//    ),
    theme: ThemeData(
      hintColor: Colors.red[200],
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey,fontSize: 14)
      )
    ),
      home: FromTest(),
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
                prefixIcon: Icon(Icons.person),
              border: InputBorder.none
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

  void initState(){
    focusNode1.addListener((){
      print(focusNode1.hasFocus);
    });
  }

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

/**
 * 表单
 */
class FromTest extends StatefulWidget{

  @override
  _FromTestState createState() {
     return _FromTestState();
  }
}

class _FromTestState extends State<FromTest>{
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _fromKey = new GlobalKey<FormState>();


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("From Test"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
        child: Form(
          key: _fromKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person),
                ),
                validator: (v){
                  return v.trim().length > 0 ? null :"用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "登录密码",
                  icon: Icon(Icons.lock),
                ),
                validator: (v){
                  return v.trim().length > 5 ? null :"密码不能少于6位";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          if((_fromKey.currentState as FormState).validate()){

                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}