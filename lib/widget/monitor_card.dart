import 'package:flutter/material.dart';

const homeImage = "http://47.102.214.210/image/house.jpg";

///监控卡片入口
class MonitorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //title
            alignment: Alignment.topLeft,
            child: Text(
              "监控",
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Card(
              elevation: 5,
              child: SizedBox(
                height: 180,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Icon(Icons.enhanced_encryption),
                            flex: 3,
                          ),
                          Expanded(
                            child: Text('6个摄像头正在工作'),
                            flex: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Card(
                      child: Image.network(homeImage),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
