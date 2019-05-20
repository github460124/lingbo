import 'package:dio/dio.dart';
import 'package:lingbo_app/model/overall_info_model.dart';

main(){
  //overallInfoDao.fetch();
}
// ignore: camel_case_types
class overallInfoDao{
  static var dio=new Dio();
  static OverallInfoEntity overallInfoEntity;

  static Future<OverallInfoEntity> fetch() async {
    Response response;
    response = await dio.get("http://47.102.214.210/json/temp/overall.json");
    if(response.statusCode == 200){
      overallInfoEntity = OverallInfoEntity.fromJson(response.data);
      //print(response.data);
      return overallInfoEntity;
    }else{
      print('链接失败！');
    }
    return null;
  }
}