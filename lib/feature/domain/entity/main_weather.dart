import '../../infrastructure/infrastructure.dart';

class WeatherMainEntity {
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
  final num pressure;
  final num humidity;

  WeatherMainEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherMainEntity.fromModel(WeatherMainModel model) {
    return WeatherMainEntity(
      temp: model.temp,
      feelsLike: model.feelsLike,
      tempMin: model.tempMin,
      tempMax: model.tempMax,
      pressure: model.pressure,
      humidity: model.humidity,
    );
  }
}