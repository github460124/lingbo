import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingbo_app/pages/monitor_page.dart';
import 'package:lingbo_app/pages/room_page.dart';

const homeImage = "http://47.102.214.210/image/house.jpg";
const customFontFamily = "SourceHanSansSC";

///监控卡片入口
// ignore: must_be_immutable
class MonitorCard extends StatelessWidget {
  ScreenUtil s = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    ScreenUtil.instance = ScreenUtil()..init(context);
    return Container(
      margin: EdgeInsets.only(top: s.setHeight(100)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _title,
          Container(
            margin: EdgeInsets.only(top: s.setHeight(100)),
            child: Card(
              elevation: 2,
              child: SizedBox(
                height: 180,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Icon(Icons.enhanced_encryption),
                            flex: 3,
                          ),
                          Expanded(
                            child: Text(
                              '6个摄像头正在工作',
                              style: TextStyle(
                                  fontSize: s.setSp(40),
                                  fontFamily: customFontFamily,
                                  fontWeight: FontWeight.normal),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                showMySimpleDialog(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Image.network(homeImage),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _title {
    return Container(
      margin: EdgeInsets.only(left: s.setWidth(54)),
      alignment: Alignment.topLeft,
      child: Text(
        "监控设备",
        textAlign: TextAlign.start,
        style: TextStyle(
            letterSpacing: 1,
            fontSize: s.setSp(32),
            fontFamily: customFontFamily,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  void showMySimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new SimpleDialog(
            title: Text('请选择'),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text("大会议室"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MonitorPage(index: 1,)));
                },
              ),
              new SimpleDialogOption(
                child: new Text("小会议室"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MonitorPage(index: 2,)));
                },
              ),
              new SimpleDialogOption(
                child: new Text("电梯厅(电动门)"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MonitorPage(index: 3,)));
                },
              ),
              new SimpleDialogOption(
                child: new Text("电梯厅(外侧)"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MonitorPage(index: 4,)));
                },
              ),
            ],
          );
        });
  }
}
