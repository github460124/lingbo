import 'package:flutter/material.dart';
import 'package:lingbo_app/widget/home_app_bar.dart';
import 'package:lingbo_app/widget/home_top_container.dart';
import 'package:lingbo_app/widget/monitor_card.dart';
import 'package:lingbo_app/widget/scenes_card.dart';
import 'package:lingbo_app/widget/security_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: HomeTopContainer(),
                            ),
                            Container(
                              child: ScenesCard(),
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
                    ]),
                  ),
                ),
              ],
            ),
          ),
          HomeAppBar(),
        ],
      ),
    );
  }
}
