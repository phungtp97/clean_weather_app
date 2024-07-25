import '../infrastructure.dart';

class WeatherListModel {
  final int dt;
  final WeatherMainModel main;
  final List<WeatherModel> weather;
  final CloudModel clouds;
  final WindModel wind;
  final int visibility;
  final double pop;
  final RainModel rain;
  final SysModel sys;
  final String dtTxt;

  WeatherListModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dtTxt,
  });

  factory WeatherListModel.fromJson(Map<String, dynamic> json) {
    return WeatherListModel(
      dt: json['dt'],
      main: WeatherMainModel.fromJson(json['main']),
      weather: (json['weather'] as List).map((i) => WeatherModel.fromJson(i)).toList(),
      clouds: CloudModel.fromJson(json['clouds']),
      wind: WindModel.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'],
      rain: RainModel.fromJson(json['rain']),
      sys: SysModel.fromJson(json['sys']),
      dtTxt: json['dt_txt'],
    );
  }
}