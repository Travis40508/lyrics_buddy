

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {

  static const _themeKey = 'theme_key';
  static const _darkThemeKey = 'dark_theme_key';
  static const _lightThemeKey = 'light_theme_key';

  static const _fontSizeKey = 'font_size_key';
  static const _defaultFontSize = 16.0;

  SharedPreferences _prefs;

  AppTheme _currentTheme;
  AppTheme get currentTheme => _currentTheme;

  double _fontSizePreference;
  double get fontSizePreference => _fontSizePreference;
  int get fontSizePreferenceAsWholeNum => _fontSizePreference.ceil();

  Settings() {
    _fetchCurrentTheme();
    _fetchCurrentFontSizePreference();
  }

  void _fetchCurrentTheme() async {
    _setDefaultTheme();

    _prefs ??= await SharedPreferences.getInstance();
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

  void _fetchCurrentFontSizePreference() async {
    _setDefaultFontSizePreference();

    _prefs ??= await SharedPreferences.getInstance();
    _fontSizePreference = _prefs.getDouble(_fontSizeKey) ?? _defaultFontSize;

    notifyListeners();
  }

  void updatePreferredFontSize(final double size) async {
    _fontSizePreference = size;
    notifyListeners();

    await _prefs.setDouble(_fontSizeKey, size);
  }

  void _setDefaultFontSizePreference() {
    _fontSizePreference = _defaultFontSize;
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