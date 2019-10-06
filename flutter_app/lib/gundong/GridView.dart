import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

/**
 * 二维网络列表
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
      home: StaggeredGridViewRoute(),
    );
  }
}

class InfiniteGridViewRoute extends StatefulWidget{


  @override
  _InfiniteGridViewState createState() {
    return _InfiniteGridViewState();
  }
}

class _InfiniteGridViewState extends State<InfiniteGridViewRoute>{

  List<IconData> _icons = [];

  void initState(){
    _retrieveIcons();
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Demo"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: _icons.length,
          itemBuilder: (context,index){
            if(index == _icons.length -1 && _icons.length < 200){
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          }
      ),
    );
  }

  void _retrieveIcons(){
    Future.delayed(Duration(microseconds: 200)).then((e){
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}
class  StaggeredGridViewRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StaggeredGridView"),
      ),
      body: new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => new Container(
            color: Colors.green,
            child: new Center(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('$index'),
              ),
            )),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 3 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}


