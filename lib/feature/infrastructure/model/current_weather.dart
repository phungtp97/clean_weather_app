import 'model.dart';

class CurrentWeatherModel {
  final CoordinateModel? coordinate;
  final List<WeatherModel> weather;
  final String? base;
  final WeatherMainModel main;
  final int visibility;
  final WindModel? wind;
  final RainModel? rain;
  final CloudModel? cloud;
  final int dt;
  final SysModel? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  final num? pop;

  CurrentWeatherModel({
    this.coordinate,
    this.base,
    this.wind,
    this.rain,
    this.cloud,
    this.sys,
    this.pop,
    required this.weather,
    required this.main,
    required this.visibility,
    required this.dt,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      coordinate: json['coord'] == null
          ? null
          : CoordinateModel.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((i) => WeatherModel.fromJson(i))
          .toList(),
      base: json['base'],
      main: WeatherMainModel.fromJson(json['main']),
      visibility: json['visibility'],
      wind: json['wind'] == null ? null : WindModel.fromJson(json['wind']),
      rain: json['rain'] == null ? null : RainModel.fromJson(json['rain']),
      pop: json['pop'],
      cloud:
          json['clouds'] == null ? null : CloudModel.fromJson(json['clouds']),
      dt: json['dt'],
      sys: SysModel.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
