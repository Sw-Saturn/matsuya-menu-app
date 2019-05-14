import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:matsuya_menu_app/Models/Menu.dart';
import 'package:matsuya_menu_app/api.dart';
import 'package:matsuya_menu_app/list.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  var morning_menus = new List<Menu>(),
      premium_menus = new List<Menu>(),
      gyuumeshi_menus = new List<Menu>(),
      curry_menus = new List<Menu>(),
      drink_menus = new List<Menu>(),
      don_menus = new List<Menu>(),
      side_menus = new List<Menu>(),
      kobachi_menus = new List<Menu>(),
      teishoku_menus = new List<Menu>(),
      topping_menus = new List<Menu>(),
      udon_menus = new List<Menu>();

  final List<Tab> tabs = <Tab>[
    Tab(
      text: '朝メニュー',
    ),
    Tab(
      text: "プレミアム牛めし",
    ),
    Tab(
      text: "牛めし",
    ),
    Tab(
      text: "カレー",
    ),
    Tab(
      text: "ドリンク",
    ),
    Tab(
      text: "丼",
    ),
    Tab(
      text: "サイドメニュー",
    ),
    Tab(
      text: "小鉢",
    ),
    Tab(
      text: "定食",
    ),
    Tab(
      text: "トッピング",
    ),
    Tab(
      text: "うどん",
    ),
  ];


  _getMenu(){
    api.getMenu('morning').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        morning_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('premium').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        premium_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('gyuumeshi').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        gyuumeshi_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('curry').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        curry_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('drink').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        drink_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('don').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        don_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('sidemenu').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        side_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('morning_kobachi').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        kobachi_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('teishoku').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        teishoku_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('topping').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        topping_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
    api.getMenu('udon').then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        udon_menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });

  }

  initState(){
    super.initState();
    _getMenu();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Matsuya Menu"),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs,
          ),
        ),
        body : TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: morning_menus.length,
                itemBuilder: (context,index){
              menuList(index, morning_menus);
            }),
            ListView.builder(
              itemCount: premium_menus.length,
                itemBuilder: (context,index){
              menuList(index, premium_menus);
            }),
            ListView.builder(
              itemCount: gyuumeshi_menus.length,
                itemBuilder: (context,index){
              menuList(index, gyuumeshi_menus);
            }),
            ListView.builder(
              itemCount: curry_menus.length,
                itemBuilder: (context,index){
              menuList(index, curry_menus);
            }),
            ListView.builder(
                itemCount: drink_menus.length,
                itemBuilder: (context,index){
              menuList(index, drink_menus);
            }),
            ListView.builder(
                itemCount: don_menus.length,
                itemBuilder: (context,index){
              menuList(index, don_menus);
            }),
            ListView.builder(
                itemCount: side_menus.length,
                itemBuilder: (context,index){
              menuList(index, side_menus);
            }),
            ListView.builder(
                itemCount: kobachi_menus.length,
                itemBuilder: (context,index){
              menuList(index, kobachi_menus);
            }),
            ListView.builder(
                itemCount: teishoku_menus.length,
                itemBuilder: (context,index){
              menuList(index, teishoku_menus);
            }),
            ListView.builder(
                itemCount: topping_menus.length,
                itemBuilder: (context,index){
              menuList(index, topping_menus);
            }),
            ListView.builder(
                itemCount: udon_menus.length,
                itemBuilder: (context,index){
              menuList(index, udon_menus);
            }),
          ],
        ),
//        body: ListView.builder(
//          itemCount: menus.length,
//          itemBuilder: (context,index){
//            return Card(
//              child: Column(
//                children: <Widget>[
//                  new ListTile(
//                    leading: Image.network(menus[index].imageURL,fit: BoxFit.cover,width: 80.0),
//                    title: new Text(menus[index].name,
//                      style: new TextStyle(fontSize: 20.0,
//                          fontWeight: FontWeight.bold),
//                    ),
//                    subtitle: new Column(mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        new Text(menus[index].description,
//                          style: new TextStyle(fontSize: 16.0,
//                              fontWeight: FontWeight.normal),
//                        ),
//                        new Text(menus[index].type,
//                        style: new TextStyle(fontSize: 12.0,
//                            fontWeight: FontWeight.normal),
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//            );
//          },
//        ),
      ),
    );
  }
}
