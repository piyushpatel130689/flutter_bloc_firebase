import 'package:shared_preferences/shared_preferences.dart';

class MySharePreference{

  ///
  /// Instantiation of the SharedPreferences library
  ///

  final String _isLogin = "islogin";

  /// ------------------------------------------------------------
  /// Method that returns the user decision to allow notifications
  /// ------------------------------------------------------------
  Future<bool> setUserLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_isLogin,value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision to allow notifications
  /// ------------------------------------------------------------
  Future<bool> getIsUserLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_isLogin) ?? false;
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision to allow notifications
  /// ------------------------------------------------------------
   clearAllPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

}