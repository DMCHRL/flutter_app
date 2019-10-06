import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 不支持延迟
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
      home: CustomScrollViewRoute(),
    );
  }
}

class CustomScrollViewRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Demo"),
              background: Image.network("http://img3.imgtn.bdimg.com/it/u=2672961933,811696830&fm=26&gp=0.jpg",fit: BoxFit.cover,),
            ),
          ),

          //Padding
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: new SliverGrid(
                delegate: new SliverChildBuilderDelegate((BuildContext context,int index){
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100* (index%9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //按两列显示
                    mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4,
                )
            ),
          ),

          //List
          new SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate((BuildContext context,int index){
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100*(index % 9)],
                  child: new Text("list item $index"),
                );
              },
                childCount: 50 //50个列表项
              ),
              itemExtent: 50,

          ),
        ],
      ),
    );
  }
}

