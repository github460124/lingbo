class DeviceModel {
  final int roomID;
  final int deviceID;
  final String deviceIcon;
  final String deviceName;

  DeviceModel({this.roomID, this.deviceID, this.deviceIcon, this.deviceName});

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      roomID: json['roomID'],
      deviceID: json['roomImage'],
      deviceIcon: json['floor'],
      deviceName: json['favoriteRoom'],
    );
  }
}
