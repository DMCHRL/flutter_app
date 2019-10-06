import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 滚动监听
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
      home: ScrollControllerRoute(),
    );
  }
}

class ScrollControllerRoute extends StatefulWidget{


  @override
  _ScrollControllerRouteState createState() {
    return _ScrollControllerRouteState();
  }
}

class _ScrollControllerRouteState extends State<ScrollControllerRoute>{
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  void initState(){
    super.initState();
    _controller.addListener((){
      print(_controller.offset);
      if(_controller.offset < 1000 && showToTopBtn){
        setState(() {
          showToTopBtn = false;
        });
      }else if( _controller.offset >= 1000 && showToTopBtn == false){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制"),),
      body: Scrollbar(
          child: ListView.builder(
              itemCount: 100,
              itemExtent: 50,
              controller: _controller,
              itemBuilder: (context,index){
                return ListTile(title: Text("$index"),);
              }
          ),
      ),
      floatingActionButton: !showToTopBtn? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }

}

