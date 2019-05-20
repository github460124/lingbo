import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lingbo_app/constans/constant.dart';
import 'package:lingbo_app/dao/receive_dao.dart';
import 'package:lingbo_app/pages/home_page.dart';
import 'package:lingbo_app/pages/my_page.dart';
import 'package:lingbo_app/pages/room_page.dart';
import 'package:lingbo_app/dao/overall_dao.dart';
import 'package:lingbo_app/model/overall_info_model.dart';
import 'package:lingbo_app/util/initUtil.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  OverallInfoEntity overallInfoEntity;
  Future<Socket> socket;
  @override
  void initState() {
    super.initState();
    initOverall();
    socket=init();
    SocketUtil.socket=socket;
    Init.deviceSocketInit();
  }
  Future<Socket> init()async{
    await SocketUtil.init();
    return SocketUtil.conn;
  }

  initOverall()async{
   overallInfoEntity=await overallInfoDao.fetch();
  }
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  List overallInfo =[
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          //需要显示的页面
          HomePage(),
          RoomPage(overallInfoEntity: overallInfoEntity,socket: socket),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: _activeColor,
                ),
                title: Text(
                  '家',
                  style: TextStyle(
                      color: _currentIndex != 0 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.apps,
                  color: _activeColor,
                ),
                title: Text(
                  '房间',
                  style: TextStyle(
                      color: _currentIndex != 1 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(
                    color: _currentIndex != 2 ? _defaultColor : _activeColor),
              ),
            ),
          ]),
    );
  } //内部类

}
