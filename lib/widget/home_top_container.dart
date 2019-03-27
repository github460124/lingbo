import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const homeImage = "http://47.102.214.210/image/house.jpg";
const customFontFamily = "SourceHanSansSC";

///主页顶部显示
class HomeTopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil()..init(context);
    ScreenUtil s = ScreenUtil();
    return Container(
      margin: EdgeInsets.fromLTRB(
          s.setWidth(54), s.setHeight(63), s.setWidth(54), s.setHeight(130)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "家",
              style: TextStyle(
                fontSize: s.setSp(80),
                fontFamily: customFontFamily,
                fontWeight: FontWeight.bold,
                wordSpacing: s.setSp(50),
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            margin: EdgeInsets.only(top: s.setHeight(49)),
            alignment: Alignment.centerLeft,
            child: Text(
              "所有门窗都以关好所有门窗都以关好所有门窗都以关好所有门窗都以关好所有门窗都以关好",
              style: TextStyle(
                fontSize: s.setSp(33),
                fontFamily: customFontFamily,
                fontWeight: FontWeight.w300,
                wordSpacing: s.setSp(50),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: s.setHeight(78)),
            //clipBehavior: Clip.antiAlias,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Image.network(
              homeImage,
              fit: BoxFit.cover,
//              color: Colors.white,
//              colorBlendMode: BlendMode.colorBurn,
              width: s.setWidth(958),
              height: s.setHeight(277),
            ),
          ),
        ],
      ),
    );
  }
}
