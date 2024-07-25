import 'dart:ui';

abstract class LocaleRepository {
  Locale getLocale();
  Future<bool> setLocale(String locale);
}
