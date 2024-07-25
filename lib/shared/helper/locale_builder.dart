import 'package:flutter/material.dart';
import '../enum/enum.dart';

class LocaleBuilder {
  LocaleBuilder._();

  static Locale getLocale(String languageCode) {
    switch (languageCode) {
      case 'vi':
        return Locale(LanguageEnum.vi.name, 'VN');
      case 'en':
      default:
        return Locale(LanguageEnum.en.name, 'US');
    }
  }

  static Locale defaultLocale() {
    return Locale(LanguageEnum.en.name, 'US');
  }

  static LanguageEnum getLocaleEnum(String languageCode) {
    switch (languageCode) {
      case 'vi':
        return LanguageEnum.vi;
      case 'en':
      default:
        return LanguageEnum.en;
    }
  }
}
