import 'package:lingbo_app/model/room_model.dart';

class HomeModel {
  final List<RoomModel> roomList;

  HomeModel({this.roomList});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var localNavListJson = json['roomList'] as List;
    List<RoomModel> roomList =
        localNavListJson.map((i) => RoomModel.fromJson(i)).toList();
    return HomeModel(
      roomList: roomList,
    );
  }
}
