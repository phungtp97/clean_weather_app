import 'package:shared_preferences/shared_preferences.dart';

import '../shared.dart';

extension SharedPrefsExtension on SharedPreferences {
  T get<T>(String key) {
    if (T == bool) {
      return getBool(key) as T;
    } else if (T == int) {
      return getInt(key) as T;
    } else if (T == double) {
      return getDouble(key) as T;
    } else if (T == String) {
      return getString(key) as T;
    } else if (T == List<String>) {
      return getStringList(key) as T;
    } else {
      throw Exception('Type is not supported');
    }
  }

  Future<bool> put<T>(String key, T value) {
    if (T == bool) {
      return setBool(key, value as bool);
    } else if (T == int) {
      return setInt(key, value as int);
    } else if (T == double) {
      return setDouble(key, value as double);
    } else if (T == String) {
      return setString(key, value as String);
    } else if (T == List<String>) {
      return setStringList(key, value as List<String>);
    } else {
      throw Exception('Type is not supported');
    }
  }

  String? get token => getString(SharedPreferencesKey.tokenKey);

  String? get locale => getString(SharedPreferencesKey.localeKey);
}