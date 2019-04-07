import 'package:shared_preferences/shared_preferences.dart';

class SharedPre{
  Future<SharedPreferences> getSPInstance() async{
    SharedPreferences sharedPreference=await SharedPreferences.getInstance();
    return sharedPreference;
  }
}