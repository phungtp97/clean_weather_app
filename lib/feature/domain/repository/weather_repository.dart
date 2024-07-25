import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../domain.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherByCoord(double lat, double lon);

  Future<Either<Failure, List<WeatherEntity>>> getWeatherForecast3HourByCoord(double lat, double lon);

  Future<Either<Failure, List<WeatherEntity>>> getWeatherForecastFiveDaysByCoord(double lat, double lon);
}