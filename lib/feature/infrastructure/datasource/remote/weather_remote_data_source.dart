import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/core.dart';
import '../../model/model.dart';
import '../../../../shared/shared.dart';

abstract class WeatherRemoteDataSource {
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeather(
      double lat, double lng);

  Future<Either<Failure, ForecastWeather3HourModel>> getForecastWeather(
      double lat, double lng);

  Future<Either<Failure, ForecastWeather3HourModel>> getForecastFiveDaysWeather(
      double lat, double lng);
}

@Singleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceIml implements WeatherRemoteDataSource {
  final Dio _dio;
  final UrlBuilder _urlBuilder;

  WeatherRemoteDataSourceIml(
      {@Named(urlBuilderStr) required UrlBuilder urlBuilder,
      @Named(mainDioStr) required Dio userDio})
      : _urlBuilder = urlBuilder,
        _dio = userDio;

  @override
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeather(
      double lat, double lng) async {
    final request = _dio.get(_urlBuilder.getWeatherUrl(lat, lng).toString());
    return request.parseGuard<CurrentWeatherModel>(
        (json) => CurrentWeatherModel.fromJson(json));
  }

  @override
  Future<Either<Failure, ForecastWeather3HourModel>> getForecastWeather(
      double lat, double lng) async {
    final request = _dio.get(_urlBuilder.getForecastUrl(lat, lng).toString());
    return request.parseGuard<ForecastWeather3HourModel>(
        (json) => ForecastWeather3HourModel.fromJson(json));
  }

  @override
  Future<Either<Failure, ForecastWeather3HourModel>> getForecastFiveDaysWeather(
      double lat, double lng) {
    final request =
        _dio.get(_urlBuilder.getForecastFiveDaysUrl(lat, lng).toString());
    return request.parseGuard<ForecastWeather3HourModel>(
        (json) => ForecastWeather3HourModel.fromJson(json));
  }
}
