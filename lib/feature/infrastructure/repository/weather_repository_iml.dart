import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:josh_weather/core/error/failure.dart';
import 'package:josh_weather/feature/domain/domain.dart';
import 'package:josh_weather/feature/infrastructure/datasource/remote/weather_remote_data_source.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryIml extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryIml({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByCoord(
      double lat, double lon) async {
    final either = await weatherRemoteDataSource.getCurrentWeather(lat, lon);
    return either.fold(
      (l) => Left(l),
      (r) => Right(WeatherEntity.fromModel(r)),
    );
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> getWeatherForecast3HourByCoord(
      double lat, double lon) async {
    final either = await weatherRemoteDataSource.getForecastWeather(lat, lon);
    return either.fold(
      (l) => Left(l),
      (r) => Right(r.list.map((e) => WeatherEntity.fromModel(e)).toList()),
    );
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> getWeatherForecastFiveDaysByCoord(double lat, double lon) async {
    final either = await weatherRemoteDataSource.getForecastFiveDaysWeather(lat, lon);
    return either.fold(
          (l) => Left(l),
          (r) => Right(r.list.map((e) => WeatherEntity.fromModel(e)).toList()),
    );
  }
}
