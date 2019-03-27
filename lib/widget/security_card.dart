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
//                left: s.setWidth(61),
//                right: s.setWidth(61)
            ),
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 2,
                  child: SizedBox(
                    height: 180,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Icon(
                                  Icons.enhanced_encryption,
                                  color: Colors.amber,
                                ),
                                flex: 3,
                              ),
                              Expanded(
                                child: Text(
                                  '已布防',
                                  style: TextStyle(
                                      fontSize: s.setSp(40),
                                      fontFamily: customFontFamily,
                                      fontWeight: FontWeight.normal),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.grey,
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.enhanced_encryption,
                                        color: Colors.amber,
                                      ),
                                      onPressed: null,
                                    ),
                                    Text(
                                      '布防',
                                      style: TextStyle(
                                          fontSize: s.setSp(40),
                                          fontFamily: customFontFamily,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.enhanced_encryption,
                                        color: Colors.grey,
                                      ),
                                      onPressed: null,
                                    ),
                                    Text(
                                      '撤防',
                                      style: TextStyle(
                                          fontSize: s.setSp(40),
                                          fontFamily: customFontFamily,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: SizedBox(
                    height: 180,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Icon(
                                  Icons.enhanced_encryption,
                                  color: Colors.amber,
                                ),
                                flex: 3,
                              ),
                              Expanded(
                                child: Text(
                                  '已布防',
                                  style: TextStyle(
                                      fontSize: s.setSp(40),
                                      fontFamily: customFontFamily,
                                      fontWeight: FontWeight.normal),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.grey,
                                    ),
                                    onPressed: null),
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.enhanced_encryption,
                                        color: Colors.amber,
                                      ),
                                      onPressed: null,
                                    ),
                                    Text(
                                      '布防',
                                      style: TextStyle(
                                          fontSize: s.setSp(40),
                                          fontFamily: customFontFamily,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.enhanced_encryption,
                                        color: Colors.grey,
                                      ),
                                      onPressed: null,
                                    ),
                                    Text('撤防'),
                                  ],
                                ),
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
}
