import 'package:flutter/material.dart';
import 'package:lingbo_app/model/weather_model_entity.dart';

class WeatherWidget extends StatelessWidget{
  final String code ;
  final String temp ;
  final String text;
  final double height;
  const WeatherWidget({Key key, this.code,this.temp,  this.height, this.text, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return code==null?Container():
      Container(
      child: Row(
        children: <Widget>[
          Text("$text",style: TextStyle(fontSize: 18),),
          Container(padding: EdgeInsets.only(left: 5),child: Text('$temp℃',style: TextStyle(fontSize: 14),),),

        ],
      ),
    );
  }
}