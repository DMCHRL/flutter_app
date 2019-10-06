import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 异步UI更新
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
      home: StreamRoute(),
    );
  }
}

Future<String> mockNetworkData() async{
  return Future.delayed(Duration(seconds: 2),()=> "我是从互联网获取的数据");
}

class FutureRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future 测试"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            //请求已结束
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return Text("Error : ${snapshot.error}");
              }else{
                return Text("Contents: ${snapshot.data}");
              }
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Stream<int> counter(){
  return Stream.periodic(Duration(seconds: 1),(i){
    return i;
  });
}

class StreamRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future 测试"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (BuildContext context,AsyncSnapshot<int> snapshot){
            if(snapshot.hasError){
              return Text("Error : ${snapshot.error}");
            }
            switch(snapshot.connectionState){
              case ConnectionState.none:return Text("没有Stream");
              case ConnectionState.waiting:return Text("等待数据");
              case ConnectionState.active:return Text("active: ${snapshot.data}");
              case ConnectionState.done:return Text("Stream已关闭");
            }
            return null;
          },
        )
      ),
    );
  }
}



