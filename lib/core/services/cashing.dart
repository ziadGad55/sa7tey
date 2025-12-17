import 'package:shared_preferences/shared_preferences.dart';

class appcashing {
  static late SharedPreferences _sharedPreferences;

  static String token='token';
  static String onBoarding='onBoarding';


  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static cashdata ({required String key,required dynamic value}) {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    }



  }
  static dynamic getdata({required String key}) {
    return _sharedPreferences.get(key);
  }
}

