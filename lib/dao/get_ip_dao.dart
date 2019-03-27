import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lingbo_app/model/get_ip_model.dart';

const GET_IP_URL = 'https://httpbin.org/ip';

class GetIpDao {
  static Future<GetIpModel> fetch() async {
    final response = await http.get(GET_IP_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return GetIpModel.fromJson(result);
    } else {
      throw Exception(
          'Error getting IP address:\nHttp status ${response.statusCode}');
    }
  }
}

//_getIPAddress() async {
//  var url = 'https://httpbin.org/ip';
//  var httpClient = new HttpClient();
//
//  String result;
//  try {
//    var request = await httpClient.getUrl(Uri.parse(url));
//    var response = await request.close();
//    if (response.statusCode == HttpStatus.OK) {
//      var json = await response.transform(utf8.decoder).join();
//      var data = jsonDecode(json);
//      result = data['origin'];
//    } else {
//      result =
//      'Error getting IP address:\nHttp status ${response.statusCode}';
//    }
//  } catch (exception) {
//    result = 'Failed getting IP address';
//  }
//
//  // If the widget was removed from the tree while the message was in flight,
//  // we want to discard the reply rather than calling setState to update our
//  // non-existent appearance.
//  if (!mounted) return;
//
//  setState(() {
//    _ipAddress = result;
//    _ipAddress = _ipAddress.substring(0, _ipAddress.indexOf(","));
//    print(_ipAddress);
//  });
//}
