import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingbo_app/dao/get_ip_dao.dart';
import 'package:lingbo_app/dao/position_dao.dart';
import 'package:lingbo_app/model/position_model.dart';
import 'package:lingbo_app/model/get_ip_model.dart';
import 'package:lingbo_app/widget/home_top_container.dart';
import 'package:lingbo_app/widget/monitor_card.dart';
import 'package:lingbo_app/widget/scenes_card.dart';
import 'package:lingbo_app/widget/security_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PositionModel position; //position model
  GetIpModel ipAddress; //ip model
  String ip = ""; //外网ip

  @override
  void initState() {
    super.initState();
    getIp();
    getLocation();
  }

  getLocation() async {
    await getIp();
    try {
      PositionModel position = await PositionDao(ip).fetch();
      if (!mounted) {
        return;
      }
      setState(() {
        print(position.city);
      });
    } catch (e) {
      print(e);
    }
  }

  getIp() async {
    try {
      GetIpModel ipAddress = await GetIpDao.fetch();
      if (!mounted) {
        return;
      }
      setState(() {
        ip = ipAddress.origin.substring(0, ipAddress.origin.indexOf(","));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil()..init(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("首页"),
        //centerTitle: true,
        //leading: WeatherWidget(weatherModleResult: weatherinfo,),
      ),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            //removeLeft: true,
            context: context,
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: HomeTopContainer(),
                              ),
                              Container(
                                child: ScenesCard(
                                  icon: Icons.wb_sunny,
                                  scenesName: "早上好",
                                ),
                              ),
                              Container(
                                child: SecurityCard(),
                              ),
                              Container(
                                child: MonitorCard(),
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
          ),
        ],
      ),
    );
  }

  barShowModelBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SizedBox(
              // height: 350,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 30,
                      child: Text(
                        'SCENES',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          onPressed: () {},
                          child: Container(
                            height: 80,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'New Scene',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          onPressed: () {},
                          child: Container(
                            height: 80,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Edit Scence',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'HOME',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FlatButton(
                            onPressed: () {},
                            child: Container(
                              height: 80,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Change Photo',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
