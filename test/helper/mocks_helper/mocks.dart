import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:josh_weather/core/core.dart';
import 'package:josh_weather/core/module/inject_module.dart';
import 'package:josh_weather/feature/application/application.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([
  MockSpec<InjectableModule>(),
  MockSpec<Dio>(),
  MockSpec<SharedPreferences>(),
  MockSpec<UseCase>(),
  MockSpec<InstantUseCase>(),
  MockSpec<InternetConnection>(),
  MockSpec<GetWeatherForecastByCoordUseCase>(),
  MockSpec<GetWeatherByCoordUseCase>(),
  MockSpec<GetLocationUseCase>(),
  MockSpec<RemoveLocationUseCase>(),
  MockSpec<SaveLocationUseCase>(),
])
String fakeApiKey = '00000';
String fakeBaseUrl = 'https://api.abc.com';
UrlBuilder urlBuilder = UrlBuilder(fakeApiKey, fakeBaseUrl);

void main() {}
