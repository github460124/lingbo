import 'package:flutter/material.dart';

const homeImage = "http://47.102.214.210/image/house.jpg";
const fontFamily = "SourceHanSansSC";

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          MyPageHeader(),
                          MyPageBody(),
//                          SizedBox(
//                            height: 800,
//                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'MyHouse',
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: Text(
                        'EDIT PROFILES',
                        style: TextStyle(fontFamily: fontFamily, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  //child: Image.asset('lib/image/tx.png'),
                  backgroundImage: NetworkImage(homeImage),
                  radius: 30,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'LAKE HOUSE SETTINGS',
                    style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  child: Text(
                    'You are a house admin',
                    style: TextStyle(fontFamily: fontFamily, fontSize: 16),
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

class MyPageBody extends StatefulWidget {
  @override
  _MyPageBody createState() => _MyPageBody();
}

class _MyPageBody extends State<MyPageBody> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return myListTitle[index];
      },
      itemCount: myListTitle.length,
    );
  }
}

const double listTitleSize = 20; //标题字体大小
const double listSubtitleSize = 16; //副标题大小
const double listTitlePaddingTop = 30; //填充间距
const double listTitleDividerHe = 1; //分割线高度

List<Widget> myListTitle = <Widget>[
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Users',
                style: TextStyle(fontSize: listTitleSize),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Automation',
                style: TextStyle(fontSize: listTitleSize),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Notifactions',
                style: TextStyle(fontSize: listTitleSize),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Licence',
                style: TextStyle(fontSize: listTitleSize),
              ),
              subtitle: Text('Standard (no remote access)'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    child: Text(
      "about LingBo",
      style: TextStyle(color: Colors.grey, fontFamily: 'siyuan', fontSize: 16),
    ),
    padding: EdgeInsets.only(top: 60, left: 20),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'About LingBo',
                style: TextStyle(fontSize: listTitleSize),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
  Container(
    padding: EdgeInsets.only(top: listTitlePaddingTop),
    child: GestureDetector(
      onTap: () {
        print('tap 000');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Legal',
                style: TextStyle(fontSize: listTitleSize),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey,
              height: listTitleDividerHe,
              indent: 0,
            ),
          ],
        ),
      ),
    ),
  ),
];
