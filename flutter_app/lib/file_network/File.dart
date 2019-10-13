import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

/**
 *
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
      home: FileOperationRoute(),
    );
  }
}

class FileOperationRoute extends StatefulWidget{
  FileOperationRoute({Key key}):super(key :key);

  @override
  _FileOperationRouteState createState() {
    return _FileOperationRouteState();
  }
}

class _FileOperationRouteState extends State<FileOperationRoute>{
  int _counter;

  void initState(){
    super.initState();
    _readCounter().then((int value){
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _getLocalFile() async{
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  Future<int> _readCounter() async{
    try{
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    }on FileSystemException{
      return 0;
    }
  }

  Future<Null> _increateCounter() async{
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }

  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("文本操作"),),
       body: new Center(
         child: new Text("点击了$_counter"),
       ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _increateCounter,
        tooltip: "Increment",
        child: new Icon(Icons.add),
      ),
    );
  }
}

