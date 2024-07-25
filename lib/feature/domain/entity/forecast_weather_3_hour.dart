import '../../infrastructure/model/model.dart';
import '../domain.dart';

class ForecastWeather3HourEntity {
  final String cod;
  final int cnt;
  final List<WeatherEntity> list;

  ForecastWeather3HourEntity({
    required this.cod,
    required this.cnt,
    required this.list,
  });

  factory ForecastWeather3HourEntity.fromModel(ForecastWeather3HourModel model) {
    return ForecastWeather3HourEntity(
      cod: model.cod,
      cnt: model.cnt,
      list: model.list.map((i) => WeatherEntity.fromModel(i)).toList(),
    );
  }
}