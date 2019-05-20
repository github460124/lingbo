import 'dart:io';
import 'dart:ui';
import 'dart:convert';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:lingbo_app/constans/constant.dart';
import 'package:lingbo_app/constans/event_bus.dart';
import 'package:lingbo_app/dao/receive_dao.dart';
import 'package:lingbo_app/model/overall_info_model.dart';
import 'package:lingbo_app/pages/device/device_page.dart';
import 'package:lingbo_app/util/initUtil.dart';
import 'package:lingbo_app/widget/device_control.dart';
import 'package:lingbo_app/widget/scenes_card.dart';
import 'package:lingbo_app/model/temp_model.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomName;
  final String roomImage;
  final int index;
  final List<OverallInfoInfoDevice> overallInfo;
  final Future<Socket> future;
  const RoomDetailPage(
      {Key key,
      this.roomName,
      this.roomImage,
      this.index,
      this.overallInfo,
      this.future})
      : super(key: key);
  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //print('OverallInfo:${widget.overallInfo[0].state}');
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.roomName),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    //color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  widget.roomName,
                                  style: TextStyle(
                                    fontFamily: 'SourceHanSansSC',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child: Text(
                                  '35~26',
                                  style: TextStyle(
                                    fontFamily: 'SourceHanSansSC',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 40, top: 3),
                                child: Text(
                                  '描述',
                                  style: TextStyle(
                                    fontFamily: 'SourceHanSansSC',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 30),
                                child: Hero(
                                  tag: "${widget.roomImage}",
                                  child: Image.network(
                                    widget.roomImage,
                                    fit: BoxFit.cover,
                                    height: 126,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //color: Colors.black,
                          //margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(top: 10),
                          child: ScenesCard(
                            sceneList: detailSence['${widget.index}'],
                          ),
                        ),
                        Container(
                          child: DevicePage(
                              socket: widget.future,
                              overallInfo: widget.overallInfo,
                              type: 'light'),
                        ),
                        Container(
                          child: DevicePage(
                              socket: widget.future,
                              overallInfo: widget.overallInfo,
                              type: 'dimlight'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //print("init State"+Cons.receiveDevicesMessage.length.toString());
    Constant.eventBus.on<Cons>().listen((event) {
      //print('event监听');
      if (!mounted) {
        return;
      }
      setState(() {
        widget.overallInfo.forEach((OverallInfoInfoDevice f){
          print("----");
          int index = widget.overallInfo.indexOf(f);
          event.receiveDevicesMessageE.forEach((OverallInfoInfoDevice c){
            print(event.receiveDevicesMessageE.length.toString());
            if (c.type == f.type && c.id == f.id){
              print("F ===:" +
                  '===name:' +
                  f.name.toString() +
                  "===dim" +
                  f.dim.toString() +
                  "===state:" +
                  f.state.toString());
              print("C ===:" +
                  '===name:' +
                  c.name.toString() +
                  "===dim" +
                  c.dim.toString() +
                  "===state:" +
                  c.state.toString());
              String name = c.name;
              widget.overallInfo[index] = c;
              widget.overallInfo[index].name = name;
              print("C final ===:" +
                  '===name:' +
                  widget.overallInfo[index].name.toString() +
                  "===dim" +
                  widget.overallInfo[index].dim.toString() +
                  "===state:" +
                  widget.overallInfo[index].state.toString());
            }
          });
        });

        /*event.receiveDevicesMessageE.forEach((OverallInfoInfoDevice f) {
            print(widget.overallInfo.length);
            widget.overallInfo.forEach((OverallInfoInfoDevice c) {
              if (c.type == f.type && c.id == f.id) {
                print("F ===:" +
                    '===name:' +
                    f.name.toString() +
                    "===dim" +
                    f.dim.toString() +
                    "===state:" +
                    f.state.toString());
                print("C ===:" +
                    '===name:' +
                    c.name.toString() +
                    "===dim" +
                    c.dim.toString() +
                    "===state:" +
                    c.state.toString());
                int index = widget.overallInfo.indexOf(c);
                String name = c.name;
                widget.overallInfo[index] = f;
                widget.overallInfo[index].name = name;
              }
            });
          });*/
        widget.overallInfo.forEach((OverallInfoInfoDevice f) {
          print("Widget initState ===:" +
              '===name:' +
              f.name.toString() +
              "===dim" +
              f.dim.toString() +
              "===state:" +
              f.state.toString());
        });
      }); //setState
    });
    //initListener();
  }
  /* initListener() {
    SocketUtil.initListener((message) {
          if(!mounted){return ;}
          setState(() {
            print("setstate:===${message.toString()}");
            //if(message==null) return;
            print("message index:${message.toString().indexOf("*")}");

            int index=message.toString().indexOf("*");


            int lastIndex=message.toString().lastIndexOf('*');
            int lastIn=message.toString().lastIndexOf("{");
            //message=message.toString().substring(lastIn,lastIndex);
            int count=((lastIndex.toInt()+1) / (index.toInt()+1)).toInt();
            print ('count---:$count');

            message=message.toString().substring(0,message.toString().indexOf("*"));
            print("message sub:$message");
            var tempJ = json.decode(message);
            OverallInfoInfoDevice tempDevice =
            OverallInfoInfoDevice.fromJson(tempJ);
            widget.overallInfo.forEach((f) {
              int index = widget.overallInfo.indexOf(f);
              OverallInfoInfoDevice device = f;
              if (device.type == tempDevice.type && device.id == tempDevice.id)
                //widget.overallInfo[index] = tempDevice;
                {
                  String name=widget.overallInfo[index].name;
                  widget.overallInfo[index]=tempDevice;
                  widget.overallInfo[index].name=name;
              }
            });


          });//setState
        });
    SocketUtil.initListener((message) {
      if (!mounted) {
        return;
      }
      print("Start listener");
      int index = message.toString().indexOf("*");
      int lastIndex = message.toString().lastIndexOf('*');
      int lastIn = message.toString().lastIndexOf("{");
      double tcount = (lastIndex.toInt() + 1) / (index.toInt() + 1);
      int count=tcount.toInt();
      int length=index+1;
      print('count---:$count');
      List tempList = new List();
      if (count == 1) {
        String temp = message.toString().substring(0, index);
        var tempJ = json.decode(temp);
        OverallInfoInfoDevice tempDevice =
            OverallInfoInfoDevice.fromJson(tempJ);
        setState(() {
          widget.overallInfo.forEach((f) {
            int index = widget.overallInfo.indexOf(f);
            OverallInfoInfoDevice device = f;
            if (device.type == tempDevice.type && device.id == tempDevice.id) {
              print("setstate:===${message.toString()}");
              print("message index:${message.toString().indexOf("*")}");
              String name = widget.overallInfo[index].name;
              widget.overallInfo[index] = tempDevice;
              widget.overallInfo[index].name = name;
            }
          });

        });//setState
      } else {
        String temp;
        for (int i = 0; i < count; i++) {

          int lastIndext = message.toString().lastIndexOf('*');
          print("I==:$i");
          temp = message.toString().substring(0, index);
          print('convert message:$temp');
          tempList.add(temp);
          if(i<count-1)
            message = message.toString().substring(index + 1, lastIndext) + "*";
          print("message sub:$message");
          var tempJ = json.decode(temp);
          print("message re:${tempJ.toString()}");
          OverallInfoInfoDevice tempDevice =
              OverallInfoInfoDevice.fromJson(tempJ);
          widget.overallInfo.forEach((f) {
            int index = widget.overallInfo.indexOf(f);
            OverallInfoInfoDevice device = f;
            if (device.type == tempDevice.type && device.id == tempDevice.id)
            //widget.overallInfo[index] = tempDevice;
            {
              setState(() {
                print("setstate:===$temp");
                //if(message==null) return;
                print("message index:${message.toString().indexOf("*")}");
                String name = widget.overallInfo[index].name;
                widget.overallInfo[index] = tempDevice;
                widget.overallInfo[index].name = name;
              });
            }
          });
        }
      }
    });

    print("Socket is listenning");
  }*/

  @override
  void deactivate() {
    super.deactivate();
    print("I AM deactivate");
    //SocketUtil.listener.cancel();
  }

  @override
  void reassemble() {
    super.reassemble();
    print("I AM reassemble");
  } // ignore: non_constant_identifier_names

  ShowModleButtomSheet(OverallInfoInfoDevice o) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            color: Colors.black54,
            child: SizedBox(
              child: Container(
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'First Floor Climate',
                                  style: TextStyle(fontSize: 20),
                                ),
                                flex: 10,
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(Icons.menu), onPressed: () {}),
                                flex: 2,
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(Icons.clear), onPressed: () {}),
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Sences',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(
                                                  '26℃',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                alignment:
                                                    Alignment.bottomRight,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(
                                                  ' COLD',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(
                                                  '26℃',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                alignment:
                                                    Alignment.bottomRight,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(
                                                  '  AutoMode',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: CircleProgressBar(
                              radius: 100.0,
                              dotColor: Colors.pink,
                              dotRadius: 18.0,
                              shadowWidth: 2.0,
                              progressChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  void didUpdateWidget(RoomDetailPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Constant.eventBus.fire(Cons(Cons.receiveDevicesMessage));
    /*setState(() {
      //print('setstate1:');
      if (Cons.receiveDevicesMessage != null) {
        Cons.receiveDevicesMessage.forEach((OverallInfoInfoDevice f) {
          widget.overallInfo.forEach((OverallInfoInfoDevice c) {
            if (c.type == f.type && c.id == f.id) {
              int index = widget.overallInfo.indexOf(c);
              String name = c.name;
              widget.overallInfo[index] = f;
              widget.overallInfo[index].name = name;
            }
          });
        });
        //print('overInfo:${widget.overallInfo[1].dim}');
      }
      widget.overallInfo.forEach((OverallInfoInfoDevice f) {
        print("Widget didChangeDependencies ===:" +
            '===name:' +
            f.name.toString() +
            "===dim" +
            f.dim.toString() +
            "===state:" +
            f.state.toString());
      });
    });*/
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }
}
