import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 原始指针事件处理
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
      home: ListenerRoute(),
    );
  }
}

class ListenerRoute extends StatefulWidget{

  @override
  ListenerRouteState createState() {
    return ListenerRouteState();
  }

}

class ListenerRouteState extends State<ListenerRoute>{

  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listener Demo"),
        ),
        body:Column(
          children: <Widget>[
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 150.0,
                child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
              ),
              onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
              onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
              onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
            ),
            Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                  child: Center(child: Text("Box A")),
                ),
                //behavior: HitTestBehavior.opaque,
                onPointerDown: (event) => print("down A")
            ),

          ],
        )
    );
  }
}

