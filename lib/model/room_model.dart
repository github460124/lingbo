class RoomModel {
  String roomName;
  String roomImage;
  int floor;
  bool favoriteRoom;

  RoomModel({this.roomName, this.roomImage, this.floor, this.favoriteRoom});

  RoomModel.fromJson(Map<String, dynamic> json) {
    roomName = json['roomName'];
    roomImage = json['roomImage'];
    floor = json['floor'];
    favoriteRoom = json['favoriteRoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomName'] = this.roomName;
    data['roomImage'] = this.roomImage;
    data['floor'] = this.floor;
    data['favoriteRoom'] = this.favoriteRoom;
    return data;
  }
}
