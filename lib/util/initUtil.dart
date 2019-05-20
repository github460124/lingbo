import 'dart:convert';

import 'package:lingbo_app/constans/constant.dart';
import 'package:lingbo_app/constans/event_bus.dart';
import 'package:lingbo_app/dao/receive_dao.dart';
import 'package:lingbo_app/model/overall_info_model.dart';
import 'package:lingbo_app/dao/overall_dao.dart';

class Init {
  static  deviceSocketInit() {
    SocketUtil.initListener((message) async{
      //print("initListener message:$message");
      List<OverallInfoInfoDevice> tempList = new List();
      tempList = stringToJson(subMessage(message));

      Cons.receiveDevicesMessage =await reduce(tempList);

      Constant.eventBus.fire(Cons(Cons.receiveDevicesMessage));

    });

    print("Socket is listenning");
  }

  static Future<List<OverallInfoInfoDevice>> reduce(List<OverallInfoInfoDevice> list) async {
    if(Cons.receiveDevicesMessage==null){
      Cons.receiveDevicesMessage = new List<OverallInfoInfoDevice>();
      OverallInfoEntity overallInfoEntity = await overallInfoDao.fetch();
      overallInfoEntity.info.forEach((OverallInfoInfo f) {
        f.device.forEach((OverallInfoInfoDevice c) {
          Cons.receiveDevicesMessage.add(c);
        });
      });
    }

    list.forEach((OverallInfoInfoDevice f){
      Cons.receiveDevicesMessage.forEach((OverallInfoInfoDevice c){
        if(f.type==c.type&&f.id==c.id)
          {
            //print("F ===:"+'===name:'+f.name.toString()+"===dim"+f.dim.toString()+"===state:"+f.state.toString());
            //print("C ===:"+'===name:'+c.name.toString()+"===dim"+c.dim.toString()+"===state:"+c.state.toString());
            int index= Cons.receiveDevicesMessage.indexOf(c);
            String name=c.name;
            Cons.receiveDevicesMessage[index]=f;
            Cons.receiveDevicesMessage[index].name=name;
            //print("C change ===:"+'===name:'+Cons.receiveDevicesMessage[index].name.toString()+"===dim"+Cons.receiveDevicesMessage[index].dim.toString()+"===state:"+Cons.receiveDevicesMessage[index].state.toString());
          }
      });
    });
    print(Cons.receiveDevicesMessage.length.toString()+"int the reduce");
    return Cons.receiveDevicesMessage;
    /*list.forEach((f) {
      if (Cons.receiveDevicesMessage == null) {
        Cons.receiveDevicesMessage.add(f);
      } else {
        Cons.receiveDevicesMessage.forEach((r) {
          if (f.type == r.type && f.id == r.id) {
            int index = Cons.receiveDevicesMessage.indexOf(r);
            String type = Cons.receiveDevicesMessage[index].type;
            switch (type) {
              case 'light':
                Cons.receiveDevicesMessage[index].state = f.state;
                break;
              case 'dimlight':
                Cons.receiveDevicesMessage[index].dim = f.dim;
                break;
              default:
                print('不被接受的类型。。。');
                break;
            }
          } else {
            Cons.receiveDevicesMessage.add(f);
          }
        });
      }
    });*/
  }

  static List<String> subMessage(String message) {
    List<String> l = new List();
    int endIndex = message.indexOf("*");
    int lastIndex = message.lastIndexOf("*");
    int count = lastIndex ~/ endIndex;

    for (int i = 0; i < count; i++) {
      int index = message.indexOf("*");
      String temp = message.substring(0, index);
      l.add(temp);

      if (i < count - 1) {
        message = message.substring(index + 1);
        //print("i:$i\nmewssage:$message\ntemp:$temp\n");
      }
    }
    //print("subMessage message:${l.toString()}");
    return l;
  }

  static List<OverallInfoInfoDevice> stringToJson(List<String> list) {
    List<OverallInfoInfoDevice> reList = new List();
    for (var i = 0; i < list.length; i++) {
      var o = list[i];
      var j = json.decode(o);
      OverallInfoInfoDevice overallInfoInfoDevice =
          OverallInfoInfoDevice.fromJson(j);
      reList.add(overallInfoInfoDevice);
    }
    //print("stringToJson message:${reList.toString()}");
    return reList;
  }

  static List<OverallInfoInfoDevice> updateDevice(
      List<OverallInfoInfoDevice> o, List<OverallInfoInfoDevice> j) {
    o.forEach((f) {
      j.forEach((c) {
        if (f.type == c.type && f.id == c.id) {
          String name = f.name;
          f = c;
          f.name = name;
        }
      });
    });
    return o;
  }
}
