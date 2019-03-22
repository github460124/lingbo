import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  @required
  final double appBarAlpha = 0;
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Opacity(
        opacity: widget.appBarAlpha,
        child: Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("首页"),
            ),
          ),
        ),
      ),
    );
  }
}
