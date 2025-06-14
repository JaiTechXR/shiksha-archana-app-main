import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  Locale get appLocal => _appLocale;
  Future<Null> fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      print(_appLocale.languageCode.toString());
      return null;
    }
    _appLocale = Locale(prefs.getString('language_code')??'');
    return  null;
  }


  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("hi")) {
      _appLocale = Locale("hi");
      await prefs.setString('language_code', 'hi');
      await prefs.setString('countryCode', '');
      print(_appLocale.languageCode.toString());

    } else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
      print(_appLocale.languageCode.toString());

    }
    notifyListeners();
  }
}

class SessionManager {


  void setString(key, value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

// Read Data
  Future<String> getString(key)  async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String value = sharedPreferences.getString(key)  ?? '';
    print("value $value");
    return value ;

  }


  Future<void> cleanPrefernces() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

}