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

    // 一般弹窗
    Future<void> changeLanguage() async{
      int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text("请选择语言"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text("中文简体"),
                ),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text("美国英语"),
                ),
              )
            ],
          );
        }
      );

      if(i != null){
        print("选择了 ${i == 1? "中文" : "英文"}");
      }
    }

    //列表弹窗
    Future<void> showListDialog() async {
      int index = await showDialog<int>(
        context: context,
        builder: (BuildContext context){
          var child = Column(
            children: <Widget>[
              ListTile(title: Text("请选择"),),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: Text("${index}"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                ),
              )
            ],
          );
          return Dialog(child: child,);
        }
      );

      if(index != null){
        print("点击了  $index");
      }
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
          RaisedButton(
            child: Text("对话框2"),
            onPressed: () async {
             changeLanguage();
            },
          ),
          RaisedButton(
            child: Text("对话框3--列表"),
            onPressed: () {
              showListDialog();
            },
          ),
        ],
      ),
    );
  }
}






