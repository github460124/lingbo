import 'package:flutter/material.dart';
import 'package:lingbo_app/pages/automation_pages/creat_temp.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';

class CreateAutomationScenes extends StatefulWidget {
  final String title;
  final Map commitInfoMap;
  const CreateAutomationScenes({Key key, this.title, this.commitInfoMap})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAutomationScenesState();
  }
}

class CreateAutomationScenesState extends State<CreateAutomationScenes> {
  List<bool> checkValue = new List();
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
                Navigator.pop(context, widget.commitInfoMap);
              }),
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  /*SideHeaderListView(
                    shrinkWrap:true,
                    padding: new EdgeInsets.all(16.0),
                    itemExtend: 48.0,
                    itemCount: parts.length,
                    headerBuilder: (BuildContext context,int index){
                      return SizedBox(width:150,child: Text(parts[index]['room'],style: TextStyle(fontSize: 30),),);
                    },
                    itemBuilder: (BuildContext context,int index){
                      return Text(parts[index]['name'],style: TextStyle(fontSize: 24),);
                    },
                    hasSameHeader: (int a,int b){
                      return parts[a]["room"] == parts[b]["room"];
                    },
                  ),*/
                  GetBody(
                    parts: parts,
                    roomName: 'BedRoom',
                  ),
                  GetBody(
                    parts: parts,
                    roomName: 'keting',
                  ),
                  GetBody(
                    parts: parts,
                    roomName: 'woshi',
                  ),
                  GetBody(
                    parts: parts,
                    roomName: 'shufang',
                  ),

                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        widget.commitInfoMap['parts'] = parts;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CreateAutomationPartpick(
                                commitInfoMap: widget.commitInfoMap,
                                title: "选择配件",
                              );
                            },
                          ),
                        );
                      },
                      child: Text('下一步'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  List<Map> parts = [

    {
      'name': "light2",
      "id": 2,
      'SW': false,
      'room': "keting",
      "dim": true,
      "value": 0.0
    },
    {
      'name': "light3",
      "id": 3,
      'SW': false,
      'room': "keting",
      "dim": false,
      "value": 0.0
    },
    {
      'name': "light4",
      "id": 4,
      'SW': false,
      'room': "woshi",
      "dim": false,
      "value": 0.0
    },
    {
      'name': "light5",
      "id": 5,
      'SW': false,
      'room': "woshi",
      "dim": false,
      "value": 0.0
    },
    {
      'name': "light6",
      "id": 6,
      'SW': false,
      'room': "shufang",
      "dim": true,
      "value": 0.0
    },

    {
      'name': "light1",
      "id": 1,
      'SW': false,
      'room': "BedRoom",
      "dim": false,
      "value": 0.0
    },
    {
      'name': "light7",
      "id": 7,
      'SW': false,
      'room': "BedRoom",
      "dim": false,
      "value": 0.0
    },
    {
      'name': "light8",
      "id": 8,
      'SW': false,
      'room': "BedRoom",
      "dim": true,
      "value": 0.0
    },



  ];
}

class GetBody extends StatefulWidget {
  final List parts;
  final String roomName;

  const GetBody({Key key, this.parts, this.roomName}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GetBodyState();
  }
}


class GetBodyState extends State<GetBody> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(widget.roomName),
          ),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.parts.length,
                itemBuilder: (context, index) {
                  return widget.parts[index].containsValue(widget.roomName)
                      ? ListTile(
                          leading: Text("${widget.parts[index]['name']}"),
                          title: widget.parts[index]['dim'] == false
                              ? Center(
                                  child: Container(
                                    child: Switch(
                                      value: widget.parts[index]["SW"],
                                      onChanged: (bool) {
                                        setState(() {
                                          //checkValue.add(bool);
                                          widget.parts[index]["SW"] =
                                              !widget.parts[index]["SW"];
                                        });
                                      },
                                    ),
                                  ),
                                )
                              : Container(
                                  child: SizedBox(
                                    height: 50,
                                    width: 100,
                                    child: FluidSlider(
                                      max: 100.0,
                                      value: widget.parts[index]['value'],
                                      onChanged: (nv) {
                                        setState(() {
                                          widget.parts[index]['value'] = nv;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                        )
                      : Container();
                }),
          ),
        ],
      ),
    );
  }
}
