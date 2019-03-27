import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:lingbo_app/dao/home_dao.dart';
import 'package:lingbo_app/model/home_model.dart';
import 'package:lingbo_app/model/room_model.dart';
import 'package:lingbo_app/widget/room_card.dart';
import 'package:lingbo_app/widget/loading_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingbo_app/widget/space_header.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

//房间页面入口
class _RoomPageState extends State<RoomPage> {
  bool _loading = true; //加载进度条

  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();

  //房间信息
  String roomName;
  String roomImage;
  int floor;
  bool favoriteRoom;

  @override
  void initState() {
    super.initState(); //调用父类的构造函数
    _handleRefresh(); //获取房间数据
  }

  List<RoomModel> roomList = [];

  Future<Null> _handleRefresh() async {
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
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffeae8e9),
      appBar: AppBar(
          elevation: 2,
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
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      //滚动且是列表滚动的时候
                      //_onScroll(scrollNotification.metrics.pixels);
                    }
                  },
                  child: _listView,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _listView {
    return ListView.builder(
        itemCount: roomList.length,
        itemBuilder: (BuildContext context, int index) {
          return RoomCard(
            roomImage: roomList[index].roomImage,
            roomName: roomList[index].roomName,
            floor: roomList[index].floor,
            favoriteRoom: roomList[index].favoriteRoom,
          );
        });
  }
}
