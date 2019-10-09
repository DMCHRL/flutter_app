import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 组合现有组件
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
      home: GradientButtonRoute(),
    );
  }
}


class GradientButton extends StatelessWidget{
  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
});

  Widget build(BuildContext context){
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ?? [theme.primaryColor,theme.primaryColorDark?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius:  borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(constraints: BoxConstraints.tightFor(height: height,width: width),
          child: Center(
            child: Padding(padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: child),
            ),
          ),
          ),
        ),
      ),
    );
  }

}

class GradientButtonRoute extends StatefulWidget{

  @override
  _GradientButtonRouteState createState() {
    return _GradientButtonRouteState();
  }
}

class _GradientButtonRouteState extends State<GradientButtonRoute>{
  Widget build(BuildContext context){
    return  Material(
      child: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.orange,Colors.red],
              height: 50,
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(

              height: 50,
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              colors: [Colors.lightBlue[300],Colors.green],
              height: 50,
              child: Text("Submit"),
              onPressed: onTap,
            )
          ],
        ),
      ),
    );
  }

  onTap(){
    print("button click");
  }
}

