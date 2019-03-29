import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///安防设备卡片入口
const customFontFamily = "SourceHanSansSC";

class SecurityCard extends StatelessWidget {
  final VoidCallback onTap1;
  final VoidCallback onTap2;

  const SecurityCard({Key key, this.onTap1, this.onTap2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil()..init(context);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _title,
          Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(60),
              ),
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      getBigCard(onTap1),
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
                        getBigCard(onTap2),
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
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(54)),
      alignment: Alignment.topLeft,
      child: Text(
        "安防设备",
        textAlign: TextAlign.start,
        style: TextStyle(
            letterSpacing: 1,
            fontSize: ScreenUtil().setSp(32),
            fontFamily: customFontFamily,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget getBigCard(VoidCallback onTap) {
    return
      InkWell(
        onTap: onTap,
        child: Card(
          child: Container(
            width: ScreenUtil().setWidth(537),
            height: ScreenUtil().setHeight(360),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(
                    right: ScreenUtil().setWidth(52),
                    top: ScreenUtil().setHeight(46),
                  ),
                  child: Icon(
                    Icons.more_horiz,
                    size: ScreenUtil().setHeight(67),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(128), ScreenUtil().setHeight(5), ScreenUtil().setWidth(128), 0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.security,
                        size: ScreenUtil().setHeight(67),
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
                                  fontSize:ScreenUtil().setSp(37)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                              child: Text(
                                "已布防",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: customFontFamily,
                                    fontSize: ScreenUtil().setSp(24)),
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
        ),
      );

  }

  Widget get _smallCard {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(537),
      height: ScreenUtil().setHeight(180),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(81), ScreenUtil().setHeight(47), ScreenUtil().setWidth(128), 0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.security,
                  size: ScreenUtil().setHeight(67),
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
                            fontSize: ScreenUtil().setSp(37)),
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
