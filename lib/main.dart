import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:matsuya_menu_app/Models/Menu.dart';
import 'package:matsuya_menu_app/api.dart';

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
  var menus = new List<Menu>();
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
    api.getMenu().then((response){
      setState((){
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        menus = list.map((model) => Menu.fromJson(model)).toList();
      });
    });
  }

  initState(){
    super.initState();
    _getMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matsuya Menu"),
        bottom: TabBar(
          isScrollable: true,
          tabs: tabs,
        ),
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context,index){
          return Card(
            child: Column(
              children: <Widget>[
                new ListTile(
                  leading: Image.network(menus[index].imageURL,fit: BoxFit.cover,width: 80.0),
                  title: new Text(menus[index].name,
                    style: new TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: new Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(menus[index].description,
                        style: new TextStyle(fontSize: 16.0,
                            fontWeight: FontWeight.normal),
                      ),
                      new Text(menus[index].type,
                      style: new TextStyle(fontSize: 12.0,
                          fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
