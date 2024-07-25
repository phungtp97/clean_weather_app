import '../infrastructure.dart';

class ForecastModel {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherListModel> list;
  final CityModel city;

  ForecastModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: (json['list'] as List).map((i) => WeatherListModel.fromJson(i)).toList(),
      city: CityModel.fromJson(json['city']),
    );
  }
}