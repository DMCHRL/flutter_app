import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 弹性布局
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
      home: FlexLayoutTestRoute(),
    );
  }
}

class FlexLayoutTestRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RowAndColumn Demo"),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 100,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                      child: Container(
                        height: 30,
                        color: Colors.red,
                      ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}


