import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:josh_weather/core/core.dart';
import 'package:josh_weather/core/module/inject_module.dart';
import 'package:josh_weather/feature/infrastructure/datasource/remote/weather_remote_data_source.dart';
import 'package:josh_weather/feature/infrastructure/infrastructure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_data_source_test.mocks.dart';
@GenerateNiceMocks([MockSpec<WeatherRemoteDataSource>(), MockSpec<InjectableModule>()])

void main() {
  late MockWeatherRemoteDataSource weatherRemoteDataSourceIml;

  const lat = -6.21462;
  const lng = 106.84513;
  CurrentWeatherModel currentWeatherModel = CurrentWeatherModel(
    coordinate: CoordinateModel(lat: -6.2146, lon: 106.8451),
    weather: [WeatherModel(description: 'clear sky', icon: '01d', id: 800, main: 'Clear')],
    base: 'stations',
    main: WeatherMainModel(feelsLike: 303.15, humidity: 74, pressure: 1010, temp: 303.15, tempMax: 303.15, tempMin: 303.15),
    visibility: 10000,
    wind: WindModel(deg: 100, speed: 2.1),
    cloud: CloudModel(all: 0),
    dt: 1629782400,
    sys: SysModel(country: 'ID', id: 9383, sunrise: 1629760000, sunset: 1629802400, type: 1),
    timezone: 25200,
    id: 1642911,
    name: 'Jakarta',
    cod: 200,
  );

  setUp(() {
    weatherRemoteDataSourceIml = MockWeatherRemoteDataSource();
  });

  test('should return a list of WeatherEntity when the call to remote data source is successful', () async {
    // arrange
    when(weatherRemoteDataSourceIml.getCurrentWeather(lat, lng)).thenAnswer((_) async => Right(currentWeatherModel));
    // act
    final result = await weatherRemoteDataSourceIml.getCurrentWeather(lat, lng);
    // assert
    expect(result, Right(currentWeatherModel));
  });

  test('should return a failure when the call to remote data source is unsuccessful', () async {
    // arrange
    when(weatherRemoteDataSourceIml.getCurrentWeather(lat, lng)).thenAnswer((_) async => Left(HttpUnknownFailure(DioError(requestOptions: RequestOptions(path: '')))));
    // act
    final result = await weatherRemoteDataSourceIml.getCurrentWeather(lat, lng);
    // assert
    expect(result, Left(HttpUnknownFailure(DioError(requestOptions: RequestOptions(path: '')))));
  });
}