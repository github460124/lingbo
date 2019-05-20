import 'dart:async';
import 'dart:convert';
import 'dart:io';

main() {
  Map map = {
    "key1": 'value1',
    "key2": 'value1',
    "key3": 'value1',
    "key4": 'value1',
    "key5": 'value1',
  };
  ServerSocket.bind('172.16.1.187', 50001).then((ss) {
    ss.listen((s) {
      print('ssss');
      s.write('{"name": "内侧筒灯", "state": 1, "dim": 80,"type":"light","id":1}*');
      s.transform(utf8.decoder).listen((message) {
        print("ServerSocket Receive Message:$message");
      });
    });
  });
  /*Socket.connect('172.16.1.187', 50001).then((s) {
    //s.write('{"name": "内侧筒灯", "state": 0, "dim": 1,"type":"light","id":1}*');
    s.transform(utf8.decoder).listen((message) {
      print("Socket receive message:$message");
    });
  });*/
}
