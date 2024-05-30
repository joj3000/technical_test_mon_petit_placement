import 'package:test_mpp/core/libs.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _keyToken = 'userPref';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setBiometry(bool value) async {
    await _preferences!.setBool(_keyToken, value);
  }

  static bool getBiometry() {
    return _preferences!.getBool(_keyToken) ?? false;
  }
}
