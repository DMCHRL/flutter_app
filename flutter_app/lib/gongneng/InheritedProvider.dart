import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 数据共享
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
      home: ProviderRoute(),
    );
  }
}

//一个通用的InheritedWidget
class InheritedProvider<T> extends InheritedWidget{

  InheritedProvider({
    @required this.data,
    Widget child
  }):super(child :child);

  final T data;

  bool updateShouldNotify(InheritedProvider<T> old){
    //调用子孙节点的didChangeDependencies
    return true;
  }

}
Type _typeOf<T>() => T;
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget{

  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;


  static T of<T>(BuildContext context){
    final type = _typeOf<InheritedProvider<T>>();
    final  InheritedProvider provider = context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState createState() {
    return _ChangeNotifierProviderState();
  }

}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>>{
  void update(){
    setState(() {

    });
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget){
    //当Provider
    if(widget.data != oldWidget.data){
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  void initState(){
    widget.data.addListener(update);
    super.initState();
  }

  void dispose(){
    widget.data.removeListener(update);
    super.dispose();
  }

  Widget build(BuildContext context){
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

//商品
class Item{
  Item(this.price,this.count);
  double price;
  int count;
}

class CartModel extends ChangeNotifier{
  final List<Item> _items = [];

  //UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0, (value,item) => value+item.count*item.price);

  void add(Item item)
  {
    _items.add(item);
    //通知监听器，重新构建InheritedProvider 更新状态
    notifyListeners();
  }

}

class ProviderRoute extends StatefulWidget{


  @override
  ProviderRouteState createState() {
    return ProviderRouteState();
  }
}



class ProviderRouteState extends State<ProviderRoute>{

  Widget build(BuildContext context){
    return
      Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context){
            return Column(
              children: <Widget>[
                Builder(builder: (context){
                  var cart = ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价：${cart.totalPrice}");
                },),
                Builder(builder: (context){
                  print("RaiseedButton build");
                  return RaisedButton(
                    child: Text("添加商品"),
                    onPressed: (){
                      ChangeNotifierProvider.of<CartModel>(context).add(Item(20,1));
                    },
                  );
                },)
              ],
            );
          }),
        ),
      );
  }
}