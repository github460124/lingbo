import 'package:flutter/material.dart';
import 'package:lingbo_app/dao/home_dao.dart';
import 'package:lingbo_app/model/home_model.dart';
import 'package:lingbo_app/model/room_model.dart';
import 'package:lingbo_app/widget/room_card.dart';
import 'package:lingbo_app/widget/loading_container.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState(); //调用父类的构造函数
    loadData();
  }

  List<RoomModel> roomList;

  loadData() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        roomList = model.roomList;

        _loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "所有房间",
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white),
      body: LoadingContainer(
        isLoading: _loading,
        child: Center(
          child: Container(
            width: 326,
            height: 466,
            child: PageView(
              controller: PageController(viewportFraction: 0.9),
              children: <Widget>[
                RoomCard(
                  roomImage: roomList[0].roomImage,
                  roomName: roomList[0].roomName,
                  floor: roomList[0].floor,
                  favoriteRoom: roomList[0].favoriteRoom,
                ),
                RoomCard(
                  roomImage: roomList[1].roomImage,
                  roomName: roomList[1].roomName,
                  floor: roomList[1].floor,
                  favoriteRoom: roomList[1].favoriteRoom,
                ),
                RoomCard(
                  roomImage: roomList[2].roomImage,
                  roomName: roomList[2].roomName,
                  floor: roomList[2].floor,
                  favoriteRoom: roomList[2].favoriteRoom,
                ),
                RoomCard(
                  roomImage: roomList[3].roomImage,
                  roomName: roomList[3].roomName,
                  floor: roomList[3].floor,
                  favoriteRoom: roomList[3].favoriteRoom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
