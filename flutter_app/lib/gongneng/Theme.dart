import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 主题
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ThemeRoute(),
    );
  }
}

class NavBar extends StatelessWidget{

  final String title;
  final Color color;

  NavBar({
    Key key,
    this.color,
    this.title
});

  Widget build(BuildContext context){
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ]
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.computeLuminance() <0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}

class NavBarRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Material(
      child:Padding(padding: const EdgeInsets.only(top: 50,),
        child: Column(
          children: <Widget>[
            NavBar(color: Colors.blue,title: "标题",),
            NavBar(color: Colors.white,title: "标题",),
          ],
        ),
      )
    );
  }
}

//实现切换主题
class ThemeRoute extends StatefulWidget{

  @override
  ThemeRouteState createState() {
    return ThemeRouteState();
  }
}

class ThemeRouteState extends State<ThemeRoute>{
  Color _themeColor = Colors.red;

  Widget build(BuildContext context){
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
        appBar: AppBar(title:Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text(" 颜色跟随主题"),
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.black
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text(" 颜色固定黑色"),
                ],
              ),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed:()=>setState(()=> _themeColor=_themeColor == Colors.teal? Colors.blue:Colors.teal),
                  child: Icon(Icons.palette),
        ),
      ),
    );
  }
}

