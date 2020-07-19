

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LyricsBuddyTheme extends ChangeNotifier {
  AppTheme _currentTheme;
  AppTheme get currentTheme => _currentTheme;
  static const _themeKey = 'theme_key';
  static const _darkThemeKey = 'dark_theme_key';
  static const _lightThemeKey = 'light_theme_key';
  SharedPreferences _prefs;

  LyricsBuddyTheme() {
    _fetchCurrentTheme();
  }

  void _fetchCurrentTheme() async {
    _setDefaultTheme();

    _prefs = await SharedPreferences.getInstance();
    final String currentTheme = _prefs.getString(_themeKey) ?? _darkThemeKey;

    _currentTheme = currentTheme == _darkThemeKey ? DarkTheme() : LightTheme();
    notifyListeners();
  }

  void changeTheme() async {
    _currentTheme = _currentTheme is DarkTheme ? LightTheme() : DarkTheme();
    await _prefs.setString(_themeKey, _currentTheme is DarkTheme ? _darkThemeKey : _lightThemeKey);

    notifyListeners();
  }

  //Sets a default theme while we wait for the theme to be fetched
  void _setDefaultTheme() {
    _currentTheme = DarkTheme();
    notifyListeners();
  }
}

abstract class AppTheme {
  ThemeData getThemeData();
}

class DarkTheme extends AppTheme{
  @override
  ThemeData getThemeData() {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.white
    );
  }

}

class LightTheme extends AppTheme {
  @override
  ThemeData getThemeData() {
    return ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black
    );
  }
}