//generate dimensions classes for home page

import 'package:flutter/cupertino.dart';

class Dimens {
  static HomeDimens? _home;
  static LocationSearchDimens? _locationSearch;

  Dimens._();

  static HomeDimens home(BuildContext context) {
    _home ??= HomeDimens(context: context);
    return _home!;
  }

  static LocationSearchDimens locationSearch(BuildContext context) {
    _locationSearch ??= LocationSearchDimens(context: context);
    return _locationSearch!;
  }

  static AppBarDimensions appBar(BuildContext context) {
    return AppBarDimensions(context);
  }
}

class HomeDimens {
  final BuildContext context;
  final EdgeInsets forecastBarPadding =
  const EdgeInsets.symmetric(vertical: 16, horizontal: 8);

  final EdgeInsets mainWeatherPadding =
  const EdgeInsets.all(8);

  final double mainWeatherHeight = 105;

  final EdgeInsets mainWeatherMargin = const EdgeInsets.all(10);

  final double hourlyForecastHeight = 140;

  final double fiveDaysForecastItemHeight = 50;

  final double footerHeight = 61;

  final EdgeInsets fiveDayForecastPadding = const EdgeInsets.symmetric(
      horizontal: 8);

  HomeDimens({required this.context});
}

class LocationSearchDimens {
  final BuildContext context;
  final EdgeInsets padding = const EdgeInsets.all(8);
  final EdgeInsets margin = const EdgeInsets.all(16);
  final double textHeight = 40;
  final EdgeInsets itemMargin = const EdgeInsets.only(
      left: 8, right: 8, top: 16);
  final double itemHeight = 80;
  final EdgeInsets itemPadding = const EdgeInsets.all(16);

  LocationSearchDimens({required this.context});
}

class AppBarDimensions {
  final double leadingSize = 24;
  final EdgeInsets leadingPadding = const EdgeInsets.symmetric(
      vertical: 17, horizontal: 20);

  final double height = 58;

  final BuildContext context;

  const AppBarDimensions(this.context);
}
