import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lingbo_app/constans/constant.dart';
import 'package:lingbo_app/constans/event_bus.dart';
import 'package:lingbo_app/database/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lingbo_app/model/overall_info_model.dart';

void main() {
  String s =
      '{"name": "light1", "state": 0, "dim": 1}*';
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'HeaderList Demo',
      theme: new ThemeData(),
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List list = new List();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('$list'),
            RaisedButton(
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //initDB();
  }

  initDB() async {
    //房间
    // ignore: unused_local_variable
    String sqlCreateRoomTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,image TEXT,favorite INTEGER,floor INTEGER,index INTEGER)';
    //灯光
    // ignore: unused_local_variable
    String sqlCreateLightTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,dim INTEGER,rgb INTEGER,hue INTEGER,index INTEGER,icon INTEGER,color INTEGER)';
    //窗帘
    // ignore: unused_local_variable
    String sqlCreateWindowTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,index INTEGER,icon INTEGER,color INTEGER)';
    //空调
    // ignore: unused_local_variable
    String sqlCreateACTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,index INTEGER,icon INTEGER,color INTEGER)';
    //地暖
    // ignore: unused_local_variable
    String sqlCreateHeatingTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,index INTEGER,icon INTEGER,color INTEGER)';
    //新风
    // ignore: unused_local_variable
    String sqlCreateAirTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,index INTEGER,icon INTEGER,color INTEGER)';
    //电视
    // ignore: unused_local_variable
    String sqlCreateTVTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,index INTEGER,icon INTEGER,color INTEGER)';
    //传感器
    // ignore: unused_local_variable
    String sqlCreateSensorTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,image TEXT,favorite INTEGER,floor INTEGER,index INTEGER)';
    //开关
    // ignore: unused_local_variable
    String sqlCreateSwitchTable =
        'CREATE TABLE room(id INTEGER PRIMARY KEY , name TEXT ,image TEXT,favorite INTEGER,floor INTEGER,index INTEGER)';

    String path = await DataBaseHelper.createDB('demo.db');
    Database db = await openDatabase(path);
    await db.transaction((txn) {
      var batch = txn.batch();
      batch.insert('room', {
        "id": 1,
        "name": "客厅",
        "image": 'url',
        'favorite': 1,
        "floor": 1,
        "index": 0
      });
      batch.insert('room', {
        "id": 1,
        "name": "客厅",
        "image": 'url',
        'favorite': 1,
        "floor": 1,
        "index": 0
      });
      batch.insert('room', {
        "id": 1,
        "name": "客厅",
        "image": 'url',
        'favorite': 1,
        "floor": 1,
        "index": 0
      });
      batch.insert('room', {
        "id": 1,
        "name": "客厅",
        "image": 'url',
        'favorite': 1,
        "floor": 1,
        "index": 0
      });

      batch.insert('light', {
        "id": 1,
        "name": "客厅",
        "image": 'url',
        'favorite': 1,
        "floor": 1,
        "index": 0
      });
      batch.insert('room', {
        "id": 1,
        "name": "客厅",
        "image": 'url',
        'favorite': 1,
        "floor": 1,
        "index": 0
      });
      batch.insert('room', {
        "id": 1,
        "name": "客厅",
        "image": 'url',
        'favorite': 1,
        "floor": 1,
        "index": 0
      });
      batch.insert('room', {
        "id": 1,
        "name": "客厅",
        "image": 'url',
        'favorite': 1,
        "floor": 1,
        "index": 0
      });
    });

    print(db);
    list = await DataBaseHelper.rawQuery('SELECT * FROM test', path);
    setState(() {});
  }
}

const List m = [
  {
    "name": "卧室",
    "index": 0,
    "device": [
      {"name": "light1", "state": 0, "dim": 1},
      {"name": "light2", "state": 1, "dim": 0},
      {"name": "light3", "state": 0, "dim": 0}
    ]
  },
  {
    "name": "客厅",
    "index": 0,
    "device": [
      {"name": "light4", "state": 1, "dim": 0},
      {"name": "light5", "state": 1, "dim": 1},
      {"name": "light6", "state": 0, "dim": 0}
    ]
  },
  {
    "name": "书房",
    "index": 0,
    "device": [
      {"name": "light7", "state": 0, "dim": 0},
      {"name": "light8", "state": 1, "dim": 0},
      {"name": "light9", "state": 1, "dim": 0}
    ]
  }
];
