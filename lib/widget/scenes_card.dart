import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const customFontFamily = "SourceHanSansSC";

///场景卡片入口
class ScenesCard extends StatefulWidget {
  final String scenesName; //场景名称
  final IconData icon; //场景图标

  const ScenesCard({Key key, this.scenesName, this.icon}) : super(key: key);

  @override
  _ScenesCardState createState() => _ScenesCardState();
}

class _ScenesCardState extends State<ScenesCard> {
  bool scenes1 = true;
  bool scenes2 = false;
  bool scenes3 = false;
  bool scenes4 = false;
  ScreenUtil s = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil()..init(context);

    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title, //卡片标题
            Container(
              margin: EdgeInsets.only(top: s.setHeight(60)),
              //color: Color(0xffeae8e9),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _scenesCard,
                      Container(
                        child: _scenesCard,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: s.setHeight(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _scenesCard,
                        Container(
                          child: _scenesCard,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget get _title {
    return Container(
      margin: EdgeInsets.only(left: s.setWidth(54)),
      alignment: Alignment.topLeft,
      child: Text(
        "家庭场景",
        textAlign: TextAlign.start,
        style: TextStyle(
            letterSpacing: 1,
            fontSize: s.setSp(32),
            fontFamily: customFontFamily,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget get _scenesCard {
    return Card(
      elevation: 2,
      child: Container(
        width: s.setWidth(514),
        height: s.setHeight(203),
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(s.setWidth(134), 0, 0, 0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                widget.icon,
                size: 26,
                color: scenes1 ? Colors.yellow : Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 23),
                child: Text(
                  widget.scenesName,
                  style: TextStyle(
                      color: scenes1 ? Colors.black : Colors.grey,
                      fontSize: s.setSp(40),
                      fontFamily: customFontFamily,
                      fontWeight: FontWeight.normal),
                  //textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
