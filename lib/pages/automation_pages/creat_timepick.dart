import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingbo_app/pages/automation_pages/create_partspick.dart';

class CreateAutomationTimepick extends StatefulWidget {
  final String title;
  final Map commitInfoMap;

  const CreateAutomationTimepick({Key key, this.title, this.commitInfoMap}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAutomationTimepickState();
  }
}


class CreateAutomationTimepickState extends State<CreateAutomationTimepick> {
  List autoList = new List();
  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              widget.commitInfoMap['isCommit'] = false;
              Navigator.of(context).pop(widget.commitInfoMap);
            }),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    '选择时间:',
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    '      ${time.hour}:${time.minute}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 10, right: 10, top: 30),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    )),
              ),
              margin: EdgeInsets.only(top: 20),
              height: 150,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime dateTime) {
                  setState(() {
                    time = dateTime;
                  });
                },
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '重复',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                      child: GridView.count(
                        crossAxisCount: 7,
                        padding: EdgeInsets.all(5),
                        shrinkWrap: true,
                        children: _getDateGrid(),
                      ),
                    ),
                  ],
                )),
            Container(
              child: RaisedButton(
                onPressed: () {
                  widget.commitInfoMap['repeatDay']=chooseDay.toList().toString();
                  widget.commitInfoMap['time']=time.hour.toString()+":"+time.minute.toString();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) {
                            return CreateAutomationScenes(
                              title: '自动化场景',
                              commitInfoMap: widget.commitInfoMap,
                            );
                          },
                          settings: RouteSettings()));
                },
                child: Text('下一步'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getDateGrid() {
    List<Widget> dateGrid = new List();
    Widget temp;
    List d = ['一', '二', '三', '四', '五', '六', '日'];
    for (int i = 0; i < 7; i++) {
      temp = new Container(
        color: Colors.white,
        child: RaisedButton(
          elevation: 0,
          color: chooseDay[i]!=null?Colors.amber[400]:Colors.grey[300],
          onPressed: (){
            setState(() {
              if(!chooseDay.contains(d[i]))
                chooseDay[i]=d[i];
              else chooseDay[i]=null;
            });
          },
          child: Text('${d[i]}'),
          shape: CircleBorder(),
        ),
      );
      dateGrid.add(temp);
    }
    return dateGrid;
  }
   List<String> chooseDay=new List(7);
}

