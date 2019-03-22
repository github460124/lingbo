import 'package:flutter/material.dart';

const homeImage = "http://47.102.214.210/image/house.jpg";

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            removeRight: true,
            removeLeft: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 256,
                          child: Image.network(
                            homeImage,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 140,
                          child: ClipOval(
                            //clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              "lib/image/tx.png",
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                            ),
                          ),
                        ),
                      ],
                    ),
                    getListTitle(0),
                    getListTitle(1),
                    getListTitle(2),
                    getListTitle(3),
                    getListTitle(4),
                    getListTitle(5),
                    Container(
                      child: SizedBox(
                        height: 800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: SizedBox(
              height: 80,
              child: AppBar(
                title: Text('个人信息'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onScroll(double pixels) {
    double alpha = pixels / 180;
    if (alpha > 1) alpha = 1;
    if (alpha < 0) alpha = 0;
    setState(() {
      appBarAlpha = alpha;
    });
  }

  Widget getListTitle(i) {
    return myListTitle[i];
  }

  List<Widget> myListTitle = <Widget>[
    ListTile(
      title: Text(
        '用户',
        style: TextStyle(fontSize: 20),
      ),
      leading: Icon(Icons.star_border),
      trailing: Icon(Icons.camera),
    ),
    ListTile(
      title: Text(
        '用户',
        style: TextStyle(fontSize: 20),
      ),
      leading: Icon(Icons.star_border),
      trailing: Icon(Icons.camera),
    ),
    ListTile(
      title: Text(
        '用户',
        style: TextStyle(fontSize: 20),
      ),
      leading: Icon(Icons.star_border),
      trailing: Icon(Icons.camera),
    ),
    ListTile(
      title: Text(
        '用户',
        style: TextStyle(fontSize: 20),
      ),
      leading: Icon(Icons.star_border),
      trailing: Icon(Icons.camera),
    ),
    ListTile(
      title: Text(
        '用户',
        style: TextStyle(fontSize: 20),
      ),
      leading: Icon(Icons.star_border),
      trailing: Icon(Icons.camera),
    ),
    ListTile(
      title: Text(
        '用户',
        style: TextStyle(fontSize: 20),
      ),
      leading: Icon(Icons.star_border),
      trailing: Icon(Icons.camera),
    ),
  ];
}
