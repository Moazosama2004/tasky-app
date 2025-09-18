import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static final PreferencesManager _instance =
      PreferencesManager._internal();

  factory PreferencesManager() {
    log('new instance of PrefrencesManager');
    return _instance;
  }

  PreferencesManager._internal();

  late final SharedPreferences _preferences;

  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // set data
  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await _preferences.setDouble(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _preferences.setInt(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await _preferences.setStringList(key, value);
  }

  // get data
  String? getString(String key) {
    return _preferences.getString(key);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }

  // Remove
  Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  Future<bool> clear() async {
    return await _preferences.clear();
  }
}
