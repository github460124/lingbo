import 'package:flutter/material.dart';
import 'package:lingbo_app/dao/receive_dao.dart';
import 'package:lingbo_app/model/overall_info_model.dart';

class DevicePage extends StatefulWidget {
  final Future socket;
  final OverallInfoInfoDevice device;
  final List<OverallInfoInfoDevice> overallInfo;
  final String type;

  const DevicePage(
      {Key key, this.socket, this.device, this.type, this.overallInfo})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DevicePageState();
  }
}

class DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (widget.type) {
      case "light":
        return GridView.count(
          childAspectRatio: 5 / 4,
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: getList(widget.overallInfo, widget.type).map((m) {
            return getGridItem(m);
          }).toList(),
          //widget.overallInfo.map((m) {return getGridItem(m);}).toList(),
        );
      case "dimlight":
        return GridView.count(
          childAspectRatio: 1 / 0.2,
          crossAxisCount: 1,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: getList(widget.overallInfo, widget.type).map((m) {
            return getDimLight(m);
          }).toList(),
          //widget.overallInfo.map((m) {return getDimLight(m);}).toList(),
        );
      default:
        return Container();
    }
  }

  Widget getGridItem(OverallInfoInfoDevice m) {
    return InkWell(
      onTap: () async {
        setState(() {
          switch (m.state) {
            case 0:
              m.state = 1;
              break;
            case 1:
              m.state = 0;
              break;
          }
          SocketUtil.sendMessage(m.type, m);
        });
      },
      child: Container(
          //color: Colors.amber,
          child: Row(
        children: <Widget>[
          Icon(
            Icons.lightbulb_outline,
            color: m.state == 0 ? Colors.grey : Colors.amber,
          ),
          Text(
            m.name,
            //m.type+m.id.toString(),
            style: TextStyle(
              color: m.state == 0 ? Colors.grey : Colors.amber,
            ),
          ),
        ],
      )),
    );
  }

  Widget getDimLight(OverallInfoInfoDevice device) {
    return Container(
      height: 60,
      //color: Colors.grey,
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(Icons.message),
          ),
          Container(
            child: Text(
              device.name,
              //device.type + device.id.toString(),
            ),
          ),
          Expanded(
            child: Slider(
                max: 100.00,
                min: 0,
                value: device.dim == null ? 0 : device.dim.toDouble(),
                onChanged: (value) {
                  setState(() {
                    device.dim = value.toInt();
                    SocketUtil.sendMessage("dimlight", device);
                  });
                },
              onChangeStart: (value){
                  if(SocketUtil.listener!=null)
                    SocketUtil.listener.pause();
              },
              onChangeEnd: (value){
                  //Future.delayed(Duration(seconds: 1));
                if(SocketUtil.listener!=null)
                  SocketUtil.listener.resume();
              },
            ),
          ),
        ],
      ),
    );
  }

  List getList(List l, type) {
    List list = new List();
    l.forEach((f) {
      if (f.type == type) list.add(f);
    });
    return list;
  }
}
