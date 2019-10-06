import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

/**
 * 支持延迟
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
      home: ListViewFixed(),
    );
  }
}

//支持延迟
class ListViewBuilderRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewBuilder Demo"),
      ),
      body:Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0,
            itemBuilder: (BuildContext context,int index){
              return ListTile(title: Text("$index"),);
            }
        )
      )
    );
  }
}

//添加一个分割组件
class ListViewSeparatedRoute extends StatelessWidget{
  //备注下划线
  Widget divider1=Divider(color: Colors.red,);
  Widget divider2=Divider(color: Colors.blue,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListViewSeparated Demo"),
        ),
        body:Scrollbar(
            child: ListView.separated(
                itemBuilder: (BuildContext context,int index){
                  return ListTile(title: Text("$index"),);
                },
                separatorBuilder:(BuildContext context,int index){
                  return index%2==0? divider1 : divider2;
                },
                itemCount: 100
            )
        )
    );
  }
}

//实例 模拟异步分批拉取数据
class InfiniteListView extends StatefulWidget{

  @override
  _InfiniteListViewState createState() {
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView>{
  static const loadingTag = "##loading##";//表尾标记

  var _words = <String>[loadingTag];

  void initState(){
    super.initState();
    _retrieveData();
  }

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("模拟异步 Demo"),
        ),
        body:Scrollbar(
            child: ListView.separated(
                itemCount: _words.length,
                itemBuilder: (context,index){
                  //到了表尾
                  if(_words[index] == loadingTag){
                    //不足100条
                    if(_words.length - 1 <100){
                      _retrieveData();
                      //显示加载图标
                      return Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(strokeWidth: 2,),
                      );
                    }else{
                      //已经加载100条数据，不能获取数据
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        child: Text("没有更多了",style: TextStyle(color: Colors.grey),),
                      );
                    }
                  }

                  //显示单词列表
                  return ListTile(title: Text(_words[index]),);
                },
                separatorBuilder: (context,index) => Divider(height: .0,),

            ),
        )
    );
  }

  void _retrieveData(){
    Future.delayed(Duration(seconds: 2)).then((e){
      _words.insertAll(_words.length -1,
        //每次生成20个单词
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建
      });
    });
  }
}

//添加固定列表头
class ListViewFixed extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("固定列表头"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("商品列表"),),
          Expanded(
            flex: 1,
            child: ListView.builder(itemBuilder: (BuildContext context,int index){
              return ListTile(title: Text("$index"),);
            }),
          ),
//          Expanded(
//            flex: 1,
//            child: Text("hello world"),
//          ),
        ],
      )
    );
  }
}





