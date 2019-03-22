import 'package:flutter/material.dart';

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
    // TODO: implement build
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                roomImage,
                height: 196,
                fit: BoxFit.fill,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 6, top: 12),
                      child: Center(
                        child: Text(
                          roomName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        _floorName(floor),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.only(bottom: 8.0, left: 12),
                          child: Text(
                            '灯光已关闭，窗帘已打开',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '当前温度：23℃ 湿度：67%',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, right: 20),
                    child: Icon(
                      Icons.favorite,
                      color: favoriteRoom ? Colors.red[500] : Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _floorName(int floor) {
    String floorName;
    switch (floor) {
      case (0):
        floorName = "地下室";
        break;
      case (1):
        floorName = "一楼";
        break;
      case (2):
        floorName = "二楼";
        break;
      case (3):
        floorName = "三楼";
        break;
    }
    return floorName;
  }
}
