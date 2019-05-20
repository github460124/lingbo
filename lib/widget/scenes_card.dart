import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const customFontFamily = "SourceHanSansSC";

///场景卡片入口
class ScenesCard extends StatefulWidget {
  final List sceneList;
  const ScenesCard({Key key, this.sceneList}) : super(key: key);

  @override
  _ScenesCardState createState() => _ScenesCardState();
}

class _ScenesCardState extends State<ScenesCard> {
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
              height: 150,
              margin: EdgeInsets.only(top: s.setHeight(60)),
              //color: Color(0xffeae8e9),
              alignment: Alignment.center,
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 2, //每行item数量
                //physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                mainAxisSpacing: 10, //主轴间隔
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 3, //item宽高比
                padding: EdgeInsets.all(5),
                children: widget.sceneList.map((m){
                  return _scenesCard(m, widget.sceneList.indexOf(m));
                }).toList(),
              ),
            ),
          ]),
    );
  }

  @override
  void initState() {
    super.initState();
  }
  Widget get _title {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: s.setWidth(54), top: s.setHeight(50)),
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

  Widget _scenesCard(Map m, int index) {
    return InkWell(
      splashColor: Colors.grey[300],
      onTap: (){
        setState(() {
          widget.sceneList.forEach((f){f["state"]=false;});
          widget.sceneList[index]['state']=true;
        });
      },
      //elevation: 2,
      //decoration: BoxDecoration(border: Border.all(width: 0.1)),
      child: Card(
        child: Container(
          //decoration: BoxDecoration(border: Border.all(width: 0.1)),
          color: Colors.white,
          alignment: Alignment.center,
          //margin: EdgeInsets.fromLTRB(s.setWidth(134), 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 5),
                  //color: Colors.blue,
                  child: Icon(
                    IconData(m['icon'], fontFamily: 'MaterialIcons'),
                    size: 26,
                    color: widget.sceneList[index]['state'] ? Color(widget.sceneList[index]["color"]) : Colors.grey,
                  ),
                ),
              ),
              Expanded(
                //margin: EdgeInsets.only(left: 23),
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
                  //color: Colors.amber,
                  child: Text(
                    m["name"],
                    style: TextStyle(
                        color: widget.sceneList[index]['state'] ? Colors.black : Colors.grey,
                        fontSize: s.setSp(40),
                        fontFamily: customFontFamily,
                        fontWeight: FontWeight.normal),
                    //textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
