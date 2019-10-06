import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 *  变换
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
      home: ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget{

  @override
  _ScaffoldRouteState createState() {
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin{
  int _selectedIndex = 1;

  TabController _tabController;
  List tabs = ["新闻","历史","图片"];

  void initState(){
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        //右边按钮
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share),onPressed: (){},),
        ],
        //左边按钮
        leading: Builder(builder: (context){
          return IconButton(
            icon:Icon(Icons.dashboard,color: Colors.white,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        bottom: TabBar(
          controller: _tabController,
          tabs:tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("Home") ),
            BottomNavigationBarItem(icon:Icon(Icons.business),title: Text("Business")),
            BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("School")),
          ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, //悬浮位置
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e){
            return Container(
              alignment: Alignment.center,
              child: Text(e,textScaleFactor: 5),
            );
          }).toList(),
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd(){}

}

class MyDrawer extends StatelessWidget{
  const MyDrawer({Key key,}):super(key : key);

  Widget build(BuildContext context){
    return Drawer(
      child: MediaQuery.removePadding(
          context:context,
          //移除抽屉菜单顶部默认留白
          removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.network(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("add account"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Manage accounts"),
                  )
                ],
              ),
            )

          ],
        ),
      )
    );
  }
}