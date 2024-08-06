import 'package:flutter/material.dart';
import '../../../../../shared/shared.dart';
import '../../../../domain/domain.dart';

class ForecastItemWidget extends StatelessWidget {
  final WeatherEntity weather;
  const ForecastItemWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.primary,
      height: Dimens.home(context)
          .fiveDaysForecastItemHeight,
      child: Row(
        children: [
          CommonUtil.getDayInWeekSec(
              weather.dt, timezoneOffset: weather.timezone)
              .text(
              style: context.textTheme
                  .bodySmall),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Image.network(
                'https://openweathermap.org/img/wn/${weather.icon}.png',
                width: 44,
                height: 44,
              ),
              '${((weather.pop ?? 0.0) * 100.0).toInt()}% rain'
                  .text(
                  style: context
                      .textTheme
                      .bodySmall),
            ],
          ).expand(),
          '${CommonUtil.kelvinToCelcius(weather.main.tempMin.toDouble(), fractionDigits: 0)}°/${CommonUtil.kelvinToCelcius(weather.main.tempMax.toDouble(), fractionDigits: 0)}°'
              .text(
              style: context.textTheme
                  .bodySmall),
        ],
      ).padding(0, 10),
    );
  }
}
