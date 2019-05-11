import 'dart:async' as prefix0;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map menu_data;
  List use_data;
  Uri uri = Uri.parse("https://matsuya.makotia.me/v4/search");


  Future getData() async{
    final response = await http.get(uri);
    menu_data = json.decode(response.body);
    debugPrint(menu_data.keys.toString());
    setState(() {
      use_data = menu_data[''];
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: use_data == null ? 0 : use_data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Column(
                  children: <Widget>[
                    Image.asset(use_data[index]['imageURL']),
                    Text(use_data[index]['name']),
                  ],
                )
            );
          }
      ),
    );
  }
}