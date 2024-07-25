import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/shared.dart';

abstract class LocaleLocalDataSource {
  Future<String> getLocale();
  Future<bool> setLocale(String locale);
}

@Singleton(as: LocaleLocalDataSource)
class LocaleLocalDataSourceImpl implements LocaleLocalDataSource {
  final SharedPreferences sharedPreferences;

  LocaleLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getLocale() async {
    return sharedPreferences.getString(SharedPreferencesKey.localeKey) ?? 'en';
  }

  @override
  Future<bool> setLocale(String locale) async {
    return sharedPreferences.setString(SharedPreferencesKey.localeKey, locale);
  }
}