import 'dart:io';
import 'dart:convert';
import 'dart:ui';

import 'package:lingbo_app/model/overall_info_model.dart';

typedef UpdateState = void Function(Object a);
class SocketUtil {
  static final String ip1 = '172.16.0.119';
  static final int port = 50001;
  static final String ip2= '172.16.0.193';
  static var conn;
  static Future<Socket> socket;
  static var listener;

  static init()async{
    conn = await Socket.connect(ip1 , port);
  }

  void writeMassage(String val, Future<Socket> f) {
    f.then((socket) {
      socket.write(val);
    });
  }

  List<int> getIntListMassage(Future<Socket> f, VoidCallback callback) {
    var list;
    f.then((socket) {
      socket.transform(utf8.decoder).listen((massage) {
        list = massage;
        print(list);
        callback();
      });
    });
    return list;
  }

  void closeSocket(Future<Socket> f) {
    f.then((socket) {
      socket.close();
    });
  }

  static sendMessage(String type, OverallInfoInfoDevice device) {
    switch (type) {
      case 'light':
        String s = device.type +
            ":" +
            device.id.toString() +
            ':state:' +
            device.state.toString()+"*";
        SocketUtil().writeMassage(s, socket);
        break;
      case 'dimlight':
        String s = device.type +
            ":" +
            device.id.toString() +
            ':dim:' +
            device.dim.toString()+"*";
        SocketUtil().writeMassage(s, socket);
        break;
      case 'havc':
        String s = device.type +
            ":" +
            device.id.toString() +
            ':power:' +
            device.power.toString() +
            ':speed:' +
            device.speed.toString() +
            ":mode:" +
            device.mode.toString() +
            ":set_temp:" +
            device.set_temp.toString() +
            ':room_temp:' +
            device.room_temp.toString()+"*";
        SocketUtil().writeMassage(s, socket);
        break;
        default:
          break;
    }
  }

  static initListener(UpdateState update){
    if(SocketUtil.listener==null){
      socket.then((s){
        listener = s.transform(utf8.decoder).listen((message){
          print("receive message:--$message");
          update(message);
        });
      });
    }else{
      print('Socket Listener is null');
    }
  }
}

main() {
  Future<Socket> f = getSocket();
  print('Main:===$f');
  //SocketUtil().getIntListMassage(f,(){},"0");
  SocketUtil().writeMassage('333333', SocketUtil.conn);
  SocketUtil().writeMassage('123456', f);
  SocketUtil().writeMassage('123456', f);
}

Future<Socket> getSocket() async {
  await SocketUtil.init();

  return SocketUtil.conn;
}
