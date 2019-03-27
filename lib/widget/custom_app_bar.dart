import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final double appBarAlpha;

  final String title;

  const CustomAppBar({Key key, this.appBarAlpha, this.title}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Opacity(
        opacity: widget.appBarAlpha,
        child: Container(
          height: 80,
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
