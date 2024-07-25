import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:josh_weather/gen/fonts.gen.dart';
import 'color.dart';

class AppTheme extends ChangeNotifier {
  late ThemeData _currentTheme;

  bool get isDark => _currentTheme == darkTheme;

  AppTheme(bool isDarkMode) {
    isDarkMode ? _currentTheme = darkTheme : _currentTheme = lightTheme;
  }

  void toggleTheme() {
    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Palette.lightBackground1));
      _currentTheme = lightTheme;
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Palette.darkBackground1));
      _currentTheme = darkTheme;
    }
    notifyListeners();
  }

  static TextStyle baseStyle = const TextStyle(
    fontSize: 16,
    color: Palette.textLight,
    fontFamily: FontFamily.poppins,
  );

  static TextStyle baseLightStyle =
      const TextStyle(fontSize: 16, color: Palette.textDark);

  static TextStyle baseDarkStyle =
      const TextStyle(fontSize: 16, color: Palette.textDark);

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Palette.primary,
    fontFamily: FontFamily.poppins,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark),
      backgroundColor: Palette.lightBackground1,
    ),
    textTheme: TextTheme(
      /// for content
      bodyLarge: baseLightStyle.copyWith(fontSize: 16),
      bodyMedium: baseLightStyle.copyWith(fontSize: 14),
      bodySmall: baseLightStyle.copyWith(fontSize: 12),

      /// for heading
      displayLarge:
          baseLightStyle.copyWith(fontSize: 72, fontWeight: FontWeight.bold),
      displayMedium:
          baseLightStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      displaySmall:
          baseLightStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),

      /// for appbar/button text
      labelLarge:
          baseDarkStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
      labelMedium:
          baseDarkStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      labelSmall:
          baseDarkStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal),

      /// for content title
      titleSmall:
          baseLightStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      titleMedium:
          baseLightStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      titleLarge:
          baseLightStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),

      /// for subtitle
    ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Palette.primary,
    fontFamily: FontFamily.poppins,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
      backgroundColor: Palette.darkBackground1,
    ),
    textTheme: TextTheme(
      /// for content
      bodyLarge: baseDarkStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: baseDarkStyle.copyWith(fontSize: 14),
      bodySmall: baseDarkStyle.copyWith(fontSize: 12),

      /// for heading
      displayLarge:
          baseDarkStyle.copyWith(fontSize: 72, fontWeight: FontWeight.bold),
      displayMedium:
          baseDarkStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      displaySmall:
          baseDarkStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),

      /// for appbar/button text
      labelLarge:
          baseDarkStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
      labelMedium:
          baseDarkStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      labelSmall:
          baseDarkStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal),

      /// for content title
      titleSmall:
          baseDarkStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      titleMedium:
          baseDarkStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      titleLarge:
          baseDarkStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),

      /// for subtitle
    ),
  );
}
