import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

/**
 * 自绘组件
 * 任意角度旋转子节点，执行动画过度
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
      home: CustomerPaintRoute(),
    );
  }
}



class CustomerPaintRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: CustomPaint(
            size: Size(300, 300),
            painter:MyPainter() ,
          )
      ),
    );
  }
}


//画笔
class MyPainter extends CustomPainter{

  void paint(Canvas canvas,Size size){
    double eWidth = size.width /15;
    double eHeight = size.height/15;

    var paint = Paint()..isAntiAlias=true..style = PaintingStyle.fill//填充
                ..color = Colors.yellow;

    canvas.drawRect(Offset.zero&size, paint);

    //画出棋盘网络
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth =1;

    for(int i=0; i<=15; i++){
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for(int i=0; i<=15; i++){
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(Offset(size.width/2-eWidth/2, size.height/2-eHeight/2),
        min(eWidth/2,eHeight/2)-2,
        paint);

    paint
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    //画一个黑子
    canvas.drawCircle(Offset(size.width/2+eWidth/2, size.height/2-eHeight/2),
        min(eWidth/2,eHeight/2)-2,
        paint);


  }

  //避免重新绘制
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}
