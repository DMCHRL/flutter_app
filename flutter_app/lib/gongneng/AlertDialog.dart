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
      home: AlertDialogRoute(),
    );
  }
}

class AlertDialogRoute extends StatelessWidget{





  @override
  Widget build(BuildContext context) {

    Future<bool> showDelteDialog(){
      return showDialog<bool>(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("提示"),
              content: Text("你确定要删除当前文件夹吗?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("取消"),
                  onPressed: ()=> Navigator.of(context).pop(),
                ),
                FlatButton(
                  child: Text("删除"),
                  onPressed: ()=> Navigator.of(context).pop(true),
                ),
              ],
            );
          }
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("AlertDialog Demo"),),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("对话框1"),
            onPressed: () async {
              bool delete = await showDelteDialog();
              if(delete == null){
                print("取消删除");
              }else{
                print("已确认删除");
              }
            },
          ),

        ],
      ),
    );
  }
}






