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
                child: Scrollbar(
                  child:ListView.builder(
                    itemCount: 30,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        title: Text("${index}"),
                        onTap: () => Navigator.of(context).pop(index),
                      );
                    },
                  ) ,
                ),
              )
            ],
          );
          return Dialog(child: child,backgroundColor: Colors.red,);
        }
      );

      if(index != null){
        print("点击了  $index");
      }
    }

    //带有复选框的
    Future<bool> showDeleteConfirmDialog2(bool withTree) {
      withTree = false; // 默认复选框不选中
      return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("您确定要删除当前文件吗?"),
                Row(
                  children: <Widget>[
                    Text("同时删除子目录？"),
                    StatefulBuilder(
                      builder: (context,_setState){
                        return Checkbox(
                          value: withTree,
                          onChanged: (bool value) {
                            //复选框选中状态发生变化时重新构建UI
                            _setState(() {
                              //更新复选框状态
                              withTree = !withTree;
                            });
                          },
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  //执行删除操作
                  Navigator.of(context).pop(withTree);
                },
              ),
            ],
          );
        },
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
          RaisedButton(
            child: Text("对话框3--自定义弹窗"),
            onPressed: () async {
              bool delete = await showCustomDialog<bool>(
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
              if(delete == null){
                print("取消删除");
              }else{
                print("已确认删除");
              }
            },
          ),
          RaisedButton(
            child: Text("对话框4--带有复选框"),
            onPressed: () async {
              bool delete = await showDeleteConfirmDialog2(false);
              if(delete == null){
                print("取消删除");
              }else{
                print("已确认删除");
              }
            },
          ),
          RaisedButton(
            child: Text("显示底部菜单列表"),
            onPressed: () async {
              int type = await _showModalBottomSheet(context);
              print(type);
            },
          ),
          RaisedButton(
            child: Text("显示Loading框"),
            onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false, //点击遮罩不关闭对话框
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Padding(
                            padding: const EdgeInsets.only(top: 26.0),
                            child: Text("正在加载，请稍后..."),
                          )
                        ],
                      ),
                    );
                  },
                );
            },
          ),
          RaisedButton(
            child: Text("Material风格的日历选择器"),
            onPressed: () async {
              var data = await _showDatePicker1(context);
              print(data);
            },
          ),
        ],
      ),
    );
  }
}

//自定义弹窗
Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}){
  final ThemeData theme = Theme.of(context,shadowThemeOnly: true);
  return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext,Animation<double> animation,Animation<double> secondaryAnimation){
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context){
            return theme != null ? Theme(data: theme,child: pageChild,) : pageChild;
          }),
        );
      },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87,//自定义遮罩颜色
    transitionDuration: const Duration(microseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

//弹窗动画
Widget _buildMaterialDialogTransitions(
BuildContext context,
Animation<double> animation,
Animation<double> secondaryAnimation,
Widget child
){
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut
    ),
    child: child,
  );
}

class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key key,
    @required this.builder,
  }) : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}

// 弹出底部菜单列表模态对话框
Future<int> _showModalBottomSheet(BuildContext context) {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

//Material风格的日历选择器
Future<DateTime> _showDatePicker1(BuildContext context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add( //未来30天可选
      Duration(days: 30),
    ),
  );
}








