import 'package:flutter/material.dart';

///安防设备卡片入口

class SecurityCard extends StatelessWidget {
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
              "安防设备",
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
                Card(
                  elevation: 5,
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
                                child: Text('已布防'),
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
                                    Text('布防'),
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
                Card(
                  elevation: 5,
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
                                child: Text('已布防'),
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
                                    Text('布防'),
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
}
