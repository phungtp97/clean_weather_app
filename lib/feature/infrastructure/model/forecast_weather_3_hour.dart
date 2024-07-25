import 'package:josh_weather/feature/infrastructure/infrastructure.dart';

class ForecastWeather3HourModel {
  final String cod;
  final int cnt;
  final List<CurrentWeatherModel> list;

  ForecastWeather3HourModel({
    required this.cod,
    required this.cnt,
    required this.list,
  });

  factory ForecastWeather3HourModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeather3HourModel(
      cod: json['cod'],
      cnt: json['cnt'],
      list: (json['list'] as List)
          .map((i) => CurrentWeatherModel.fromJson(i))
          .toList(),
    );
  }
}