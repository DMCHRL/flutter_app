import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

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
      home: HttpRoute(),
    );
  }
}

class HttpRoute extends StatefulWidget{

  @override
  HttpRouteState createState() {
    return HttpRouteState();
  }
}

class HttpRouteState extends State<HttpRoute>{
  bool _loading  = false;
  String _text ="ww";
  Dio _dio = new Dio();
  
  Widget build(BuildContext context){
    return Material(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("获取数据"),
                onPressed: _loading?null : ()async{
                  setState(() {
                    _loading = true;
                    _text ="正在请求";
                  });
                  try{
//                    HttpClient httpClient = new HttpClient();
//                    HttpClientRequest request = await httpClient.getUrl(Uri.parse("http://192.168.1.242:8080/getUser"));
//                    HttpClientResponse response = await request.close();
//
//                    _text = await response.transform(utf8.decoder).join();
                    Response response = await _dio.get("http://192.168.1.242:8080/getUser");
                    _text = response.data.toString();

                    print(_text);
                    List item = json.decode( response.data.toString());
                    print(item[0]);

                    //httpClient.close();
                  }catch(e){
                    _text =" 请求失败：$e";
                  }finally{
                    setState(() {
                      _loading = false;
                    });
                  }
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width-50,
                child: Text(_text),
              )
            ],
          ),
        ),
      ),
    );
  }
}

