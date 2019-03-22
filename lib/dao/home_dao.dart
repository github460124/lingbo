import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lingbo_app/model/home_model.dart';

const HOME_URL = 'http://47.102.214.210/';

class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}
