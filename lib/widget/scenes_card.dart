import 'package:flutter/material.dart';

///场景卡片入口
class ScenesCard extends StatefulWidget {
  @override
  _ScenesCardState createState() => _ScenesCardState();
}

class _ScenesCardState extends State<ScenesCard> {
  bool scenes1 = true;
  bool scenes2 = false;
  bool scenes3 = false;
  bool scenes4 = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            //margin: EdgeInsets.only(top: 16),
            child: Text(
              "家庭场景",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 90,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 90,
                                child: RaisedButton(
                                  //padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  splashColor:
                                      scenes1 ? Colors.amber : Colors.grey,
                                  //highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: () {
                                    setState(() {
                                      scenes1 = true;
                                      scenes2 = false;
                                      scenes3 = false;
                                      scenes4 = false;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.wb_sunny,
                                        color: scenes1
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                      Text("早上好",
                                          style: TextStyle(
                                              color: scenes1
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontSize: 18),
                                          textAlign: TextAlign.start),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 90,
                                child: RaisedButton(
                                  //padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  splashColor:
                                      scenes2 ? Colors.blue : Colors.grey,
                                  //highlightColor: Colors.blue,
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 10,
                                  onPressed: () {
                                    setState(() {
                                      scenes1 = false;
                                      scenes2 = true;
                                      scenes3 = false;
                                      scenes4 = false;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.brightness_2,
                                        color:
                                            scenes2 ? Colors.blue : Colors.grey,
                                      ),
                                      Text(
                                        "晚上好",
                                        style: TextStyle(
                                            color: scenes2
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 18),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 90,
                              child: RaisedButton(
                                //padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                splashColor:
                                    scenes3 ? Colors.amber : Colors.grey,
                                highlightColor: Colors.blue,
                                disabledColor: Colors.white,
                                color: Colors.white,
                                elevation: 10,
                                onPressed: () {
                                  setState(() {
                                    scenes1 = false;
                                    scenes2 = false;
                                    scenes3 = true;
                                    scenes4 = false;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.accessibility,
                                      color:
                                          scenes3 ? Colors.amber : Colors.grey,
                                    ),
                                    Text("回家",
                                        style: TextStyle(
                                            color: scenes3
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 18),
                                        textAlign: TextAlign.start),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 90,
                              child: RaisedButton(
                                //padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                splashColor:
                                    scenes4 ? Colors.amber : Colors.grey,
                                highlightColor: Colors.blue,
                                disabledColor: Colors.white,
                                color: Colors.white,
                                elevation: 10,
                                onPressed: () {
                                  setState(() {
                                    scenes1 = false;
                                    scenes2 = false;
                                    scenes3 = false;
                                    scenes4 = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.departure_board,
                                      color:
                                          scenes4 ? Colors.amber : Colors.grey,
                                    ),
                                    Text(
                                      "出行",
                                      style: TextStyle(
                                        color: scenes4
                                            ? Colors.black
                                            : Colors.grey,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
}
