import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lingbo_app/pages/automation_pages/creat_timepick.dart';
import 'package:lingbo_app/util/local_notification.dart';

class AutomationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AutomationPageState();
  }
}

class AutomationPageState extends State<AutomationPage> {
  List autoInfoList;
  Map commitInfoMap = new Map();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return autoInfoList == null
        ? Scaffold(
            appBar: AppBar(),
            body: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text('您还没有创建自动化，请点击下面按钮开始创建'),
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  settings: RouteSettings(),
                                  builder: (BuildContext context) {
                                    return CreateAutomationTimepick(
                                      title: '事时间自动化',
                                      commitInfoMap: commitInfoMap,
                                    );
                                  }),
                            ).then((result) {
                              commitInfoMap = result;
                              //setState(() {});
                            });
                          });
                        },
                        child: Text("创建自动化"),
                      ),
                    )
                  ]),
            ),
          )
        : Container();
  }

  var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  MyLocalNotification myLocalNotification = new MyLocalNotification();
  @override
  void initState() {
    super.initState();
    myLocalNotification.init(context);
  }
}





