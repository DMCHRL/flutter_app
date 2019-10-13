import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

/**
 *http 第三方库
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
      home: FutureBuilderRoute(),
    );
  }
}

class FutureBuilderRoute extends StatefulWidget{

  @override
  FutrueBuilderRouteState createState() {
    return FutrueBuilderRouteState();
  }
}

class FutrueBuilderRouteState extends State<FutureBuilderRoute>{
  Dio dio = new Dio();

  Widget build(BuildContext context){
    return Material(
      child: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: dio.get("http://192.168.1.242:8080/getUser"),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              print(response.data);

              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              return Text(response.data);
            }

            return CircularProgressIndicator();
          },

        ),
      ),
    );
  }
}
