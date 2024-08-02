import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:josh_weather/core/core.dart';
import 'package:josh_weather/feature/infrastructure/datasource/remote/weather_remote_data_source.dart';
import 'package:josh_weather/feature/infrastructure/infrastructure.dart';
import 'package:mockito/mockito.dart';

import '../../helper/json_reader.dart';
import '../../helper/mocks_helper/mocks.dart';
import '../../helper/mocks_helper/mocks.mocks.dart';

void main() {
  const lat = -6.21462;
  const lng = 106.84513;
  final fakeDio = MockDio();
  late WeatherRemoteDataSourceIml weatherRemoteDataSourceIml =
      WeatherRemoteDataSourceIml(urlBuilder: urlBuilder, userDio: fakeDio);
  final weatherModel = CurrentWeatherModel.fromJson(json.decode(readJson('helper/fake_data/fake_current_weather.json')));
  final forecastModel = ForecastWeather3HourModel.fromJson(json.decode(readJson('helper/fake_data/fake_forecast.json')));
  test(
      'should return a WeatherEntity when the call to remote data source is successful',
      () async {
    final uri = urlBuilder.getWeatherUrl(lat, lng);
    when(fakeDio.get(uri.toString())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: uri.path),
        data: json.decode(readJson('helper/fake_data/fake_current_weather.json'))));
    final result = await weatherRemoteDataSourceIml.getCurrentWeather(lat, lng);
    expect(result, equals(Right<Failure, CurrentWeatherModel>(weatherModel)));
  });

  test(
      'should return a list of WeatherEntity when the call to remote data source is successful',
      () async {
    final uri = urlBuilder.getForecastUrl(lat, lng);
    when(fakeDio.get(uri.toString())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: uri.path),
        data: json.decode(readJson('helper/fake_data/fake_forecast.json'))));
    final result = await weatherRemoteDataSourceIml.getForecastWeather(lat, lng);
    expect(result, Right<Failure, ForecastWeather3HourModel>(forecastModel));
  });
}
