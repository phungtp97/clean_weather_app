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
  final SharedPreferences _prefServices;

  final String baseUrl;
  final Dio _userDio;
  final Dio _publicDio;

  final String _apiKey;

  WeatherRemoteDataSourceIml(
      {required SharedPreferences prefServices,
      @Named(apiKeyStr) required String apiKey,
      @Named(baseURLStr) required this.baseUrl,
      @Named(authenticatedApiStr) required Dio userDio,
      @Named(publicApiStr) required Dio publicDio})
      : _prefServices = prefServices,
        _apiKey = apiKey,
        _userDio = userDio,
        _publicDio = publicDio;

  @override
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeather(
      double lat, double lng) async {
    final request = _publicDio
        .get('$baseUrl/weather', queryParameters: {
          'lat': lat,
          'lon': lng,
          'appid': _apiKey
        })
        .connectionGuard();

    return request.parseGuard<CurrentWeatherModel>(
        (json) => CurrentWeatherModel.fromJson(json));
  }

  @override
  Future<Either<Failure, ForecastWeather3HourModel>> getForecastWeather(double lat, double lng) async {
    final request = _publicDio
        .get('$baseUrl/forecast', queryParameters: {
          'lat': lat,
          'lon': lng,
          'appid': _apiKey
        })
        .connectionGuard();
    return request.parseGuard<ForecastWeather3HourModel>(
        (json) => ForecastWeather3HourModel.fromJson(json));
  }

  @override
  Future<Either<Failure, ForecastWeather3HourModel>> getForecastFiveDaysWeather(double lat, double lng) {
    final request = _publicDio
        .get('$baseUrl/forecast/daily', queryParameters: {
      'lat': lat,
      'lon': lng,
      'appid': _apiKey
    })
        .connectionGuard();
    return request.parseGuard<ForecastWeather3HourModel>(
            (json) => ForecastWeather3HourModel.fromJson(json));
  }
}
