import 'dart:core';
import 'package:flutter/material.dart';
import 'package:matsuya_menu_app/Models/Menu.dart';

menuList(int index,List<Menu> menus){
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
}