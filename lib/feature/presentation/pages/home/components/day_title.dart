import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../../../../domain/domain.dart';

class DayTitleWidget extends StatelessWidget {
  final WeatherEntity weather;

  const DayTitleWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
      Palette.primary,
      width:
      double.infinity,
      padding:
      const EdgeInsets
          .symmetric(
          horizontal:
          16,
          vertical: 4),
      child: '${CommonUtil.getDayInWeekSec(weather.dt, timezoneOffset: weather.timezone)} | ${CommonUtil
          .getFormattedMonthDaySec(weather.dt, timezoneOffset: weather.timezone)}'.text(
          style: context
              .textTheme
              .labelSmall
              ?.copyWith(
              fontWeight:
              FontWeight
                  .bold)),
    );
  }
}
