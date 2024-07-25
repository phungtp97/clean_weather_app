import 'dart:ui';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/shared.dart';
import '../../domain/repository/local_repository.dart';

@LazySingleton(as: LocaleRepository)
class LocaleRepositoryIml implements LocaleRepository {
  final SharedPreferences sharedPreferences;

  LocaleRepositoryIml({required this.sharedPreferences});

  @override
  Future<bool> setLocale(String locale) =>
      sharedPreferences.put(SharedPreferencesKey.localeKey, locale);

  @override
  Locale getLocale() {
    final locale = sharedPreferences.getString(SharedPreferencesKey.localeKey);
    if (locale != null) {
      return LocaleBuilder.getLocale(locale);
    } else {
      return LocaleBuilder.defaultLocale();
    }
  }
}