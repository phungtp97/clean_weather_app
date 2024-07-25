import 'package:josh_weather/feature/infrastructure/infrastructure.dart';

class CityModel {
  final int id;
  final String name;
  final CoordinateModel coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      coord: CoordinateModel.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}