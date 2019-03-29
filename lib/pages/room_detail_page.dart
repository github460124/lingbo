import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingbo_app/widget/scenes_card.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomName;
  final String roomImage;

  const RoomDetailPage({Key key, this.roomName, this.roomImage})
      : super(key: key);
  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.roomName),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.more_horiz),
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
                                padding:
                                EdgeInsets.only(left: 12, right: 12, top: 30),
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
                          ),),
                          Container(
                            //color: Colors.black,
                            //margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(top: 10),
                            child: ScenesCard(
                              icon: Icons.image,
                              scenesName: "睡眠模式",
                            ),
                          ),

                          //DeviceCard(title: "123", state: '123', iconData: Icons.lightbulb_outline),
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


}
