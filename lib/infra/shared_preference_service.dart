import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late SharedPreferences sharedPreferences;


   Future<void> initializeSharedPreferences() async {

    sharedPreferences = await Modular.getAsync();
  }

  setBoolValue(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  bool getBoolValue(String key) {
    var value = sharedPreferences.getBool(key);
    if (value != null) {
      return value;
    }

    return false;
  }

  setStringValue(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  getStringValue(String key) async {
    return sharedPreferences.getString(key) ?? "";
  }
}
