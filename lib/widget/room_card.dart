import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const customFontFamily = "SourceHanSansSC";

///房间卡片入口
class RoomCard extends StatelessWidget {
  final String roomImage;
  final String roomName;
  final int floor;
  final bool favoriteRoom;

  const RoomCard(
      {Key key, this.roomImage, this.roomName, this.floor, this.favoriteRoom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil()..init(context);
    // TODO: implement build
    return GestureDetector(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
        child: SizedBox(
          height: ScreenUtil().setHeight(614),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(957),
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(48),
                    left: ScreenUtil().setHeight(60)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        roomName,
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(60),
                            letterSpacing: 4,
                            fontWeight: FontWeight.bold,
                            fontFamily: customFontFamily),
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: favoriteRoom ? Colors.red[500] : Colors.grey[500],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(31),
                    left: ScreenUtil().setHeight(60)),
                child: Row(
                  children: <Widget>[
                    Text(
                      "当前温度：23℃ 湿度：67%",
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(36),
                        fontFamily: customFontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(10),
                    left: ScreenUtil().setHeight(60)),
                child: Row(
                  children: <Widget>[
                    Text(
                      "所有门窗皆以关好",
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(36),
                        fontFamily: customFontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(48),
                    left: ScreenUtil().setHeight(60)),
                width: ScreenUtil.getInstance().setWidth(957),
                height: ScreenUtil.getInstance().setHeight(225),
                child: Image.network(
                  roomImage,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//  _floorName(int floor) {
//    String floorName;
//    switch (floor) {
//      case (0):
//        floorName = "地下室";
//        break;
//      case (1):
//        floorName = "一楼";
//        break;
//      case (2):
//        floorName = "二楼";
//        break;
//      case (3):
//        floorName = "三楼";
//        break;
//    }
//    return floorName;
//  }
}
