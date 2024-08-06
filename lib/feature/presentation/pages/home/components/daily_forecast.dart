import 'package:flutter/material.dart';
import 'package:josh_weather/shared/shared.dart';

import '../../../../domain/domain.dart';

class DailyForecastWidget extends StatelessWidget {
  final List<WeatherEntity> weathers;

  final int? timezone;
  const DailyForecastWidget({super.key, required this.weathers, this.timezone});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.primary,
      padding: const EdgeInsets.all(4),
      child: Row(
        children: weathers.take(5).map((e) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonUtil.getFormattedHourSec(e.dt, timezoneOffset: timezone)
                  .text(style: context.textTheme.bodyMedium),
              Image.network(
                'https://openweathermap.org/img/wn/${e.icon}.png',
                width: 44,
                height: 44,
              ),
              '${CommonUtil.kelvinToCelcius(e.main.tempMin.toDouble(), fractionDigits: 0)}°/${CommonUtil.kelvinToCelcius(e.main.tempMax.toDouble(), fractionDigits: 0)}°'
                  .text(style: context.textTheme.bodySmall),
              '${((e.pop ?? 0.0) * 100.0).toInt()}% rain'
                  .text(style: context.textTheme.bodySmall),
            ],
          ).expand();
        }).toList(),
      ),
    ).expand();
  }
}
