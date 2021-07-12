import 'package:shared_preferences/shared_preferences.dart';

class MySharePreference {
  final String _isLogin = "islogin";
  final String _isDarkMode = "isDarkMode";

  Future<bool> setUserLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_isLogin, value);
  }

  Future<bool> getIsUserLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_isLogin) ?? false;
  }

  Future<bool> setDarkMode(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_isDarkMode, value);
  }

  Future<bool> getIsDarkMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_isDarkMode) ?? false;
  }

  clearAllPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }
}
