import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///安防设备卡片入口
const customFontFamily = "SourceHanSansSC";

class SecurityCard extends StatelessWidget {
  ScreenUtil s = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil()..init(context);

    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: s.setHeight(100)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _title,
          Container(
              margin: EdgeInsets.only(
                top: s.setHeight(60),
              ),
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _bigCard,
                      Expanded(
                        child: Column(
                          children: <Widget>[_smallCard, _smallCard],
                        ),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        _bigCard,
                        Expanded(
                          child: Column(
                            children: <Widget>[_smallCard, _smallCard],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget get _title {
    return Container(
      margin: EdgeInsets.only(left: s.setWidth(54)),
      alignment: Alignment.topLeft,
      child: Text(
        "安防设备",
        textAlign: TextAlign.start,
        style: TextStyle(
            letterSpacing: 1,
            fontSize: s.setSp(32),
            fontFamily: customFontFamily,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget get _bigCard {
    return Card(
      child: Container(
        width: s.setWidth(537),
        height: s.setHeight(360),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                right: s.setWidth(52),
                top: s.setHeight(46),
              ),
              child: Icon(
                Icons.more_horiz,
                size: s.setHeight(67),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(
                  s.setWidth(128), s.setHeight(5), s.setWidth(128), 0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.security,
                    size: s.setHeight(67),
                    color: Colors.yellow,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "安防",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: customFontFamily,
                              fontSize: s.setSp(37)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: s.setWidth(12)),
                          child: Text(
                            "已布防",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: customFontFamily,
                                fontSize: s.setSp(24)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _smallCard {
    return Container(
      color: Colors.white,
      width: s.setWidth(537),
      height: s.setHeight(180),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(
                s.setWidth(81), s.setHeight(47), s.setWidth(128), 0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.security,
                  size: s.setHeight(67),
                  color: Colors.yellow,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "布防",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: customFontFamily,
                            fontSize: s.setSp(37)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
