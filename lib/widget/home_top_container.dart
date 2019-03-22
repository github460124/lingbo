import 'package:flutter/material.dart';

const homeImage = "http://47.102.214.210/image/house.jpg";

///主页顶部显示
class HomeTopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Card(
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Image.network(
                homeImage,
                fit: BoxFit.cover,
                color: Colors.white,
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
