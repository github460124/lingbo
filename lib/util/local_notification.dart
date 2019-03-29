import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyLocalNotification {
  BuildContext context;
  static var flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  MyLocalNotification();

  init(BuildContext context) {
    this.context=context;
    var initializationSettingsAndroid =
        new AndroidInitializationSettings("app_icon");
    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidRecieveLocalNotification);
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    //payload 可作为通知的一个标记，区分点击的通知。
    if (payload != null && payload == "complete") {
      await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => Container(
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                  ),
                  body: Container(
                    child: Text("welcome to security page"),
                  ),
                ),
              ),
        ),
      );
    }
  }

  Future onDidRecieveLocalNotification(
      int id, String title, String body, String payload) async {
    // 展示通知内容的 dialog.
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
            title: new Text(title),
            content: new Text(body),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text('Ok'),
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                  await Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Container(
                            child: Text('sec'),
                          ), //new SecondScreen(payload),
                    ),
                  );
                },
              )
            ],
          ),
    );
  }

  Future showNotification(String id, String title, String content) async {
    //安卓的通知配置，必填参数是渠道id, 名称, 和描述, 可选填通知的图标，重要度等等。
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        '$id', '$title', '$content',
        importance: Importance.Max, priority: Priority.High);
    //IOS的通知配置
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    //显示通知，其中 0 代表通知的 id，用于区分通知。
    await flutterLocalNotificationsPlugin.show(
        0, '$title', '$content', platformChannelSpecifics,
        payload: 'complete');
  }

  //删除单个通知
  Future cancelNotification() async {
    //参数 0 为需要删除的通知的id
    await flutterLocalNotificationsPlugin.cancel(0);
  }

//删除所有通知
  Future cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
