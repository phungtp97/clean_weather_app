import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:josh_weather/core/core.dart';
import 'package:josh_weather/feature/infrastructure/datasource/remote/weather_remote_data_source.dart';
import 'package:josh_weather/feature/infrastructure/infrastructure.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/fake_data/get_fake_data.dart';
import '../../../helper/json_reader.dart';
import '../../../helper/mocks_helper/mocks.dart';
import '../../../helper/mocks_helper/mocks.mocks.dart';

void main() {
  const lat = -6.21462;
  const lng = 106.84513;
  late Dio fakeDio;
  late WeatherRemoteDataSourceIml weatherRemoteDataSourceIml;
  setUp(() {
    fakeDio = MockDio();
    weatherRemoteDataSourceIml =
        WeatherRemoteDataSourceIml(urlBuilder: urlBuilder, userDio: fakeDio);
  });

  final weatherModel = CurrentWeatherModel.fromJson(fakeCurrentWeatherJson);
  final forecastModel = ForecastWeather3HourModel.fromJson(fakeForecastJson);
  test(
      'should return a WeatherEntity when the call to remote data source is successful',
      () async {
    final uri = urlBuilder.getWeatherUrl(lat, lng);
    when(fakeDio.get(uri.toString())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: uri.path),
        data: fakeCurrentWeatherJson));
    final result = await weatherRemoteDataSourceIml.getCurrentWeather(lat, lng);
    expect(result, equals(Right<Failure, CurrentWeatherModel>(weatherModel)));
    result.fold((l) => fail(l.toString()), (r) => expect(r, weatherModel));
  });

  test(
      'should return a list of WeatherEntity when the call to remote data source is successful',
      () async {
    final uri = urlBuilder.getForecastUrl(lat, lng);
    when(fakeDio.get(uri.toString())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: uri.path),
        data: fakeForecastJson));
    final result =
        await weatherRemoteDataSourceIml.getForecastWeather(lat, lng);
    result.fold((l) => fail(l.toString()), (r) => expect(r, forecastModel));
  });

  test(
      'should return a list of WeatherEntity when the call to remote data source is successful',
      () async {
    final uri = urlBuilder.getForecastFiveDaysUrl(lat, lng);
    when(fakeDio.get(uri.toString())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: uri.path),
        data: fakeForecastJson));
    final result =
        await weatherRemoteDataSourceIml.getForecastFiveDaysWeather(lat, lng);
    result.fold((l) => fail(l.toString()), (r) => expect(r, forecastModel));
  });
}
