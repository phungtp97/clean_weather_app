import 'package:dio/dio.dart';
import 'package:josh_weather/core/core.dart';
import 'package:josh_weather/core/module/inject_module.dart';
import 'package:josh_weather/feature/infrastructure/datasource/data_source.dart';
import 'package:josh_weather/feature/infrastructure/datasource/remote/weather_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<WeatherRemoteDataSourceIml>(), MockSpec<MyLocationLocalDataSourceImpl>(), MockSpec<InjectableModule>(), MockSpec<Dio>(), MockSpec<SharedPreferences>()])

String fakeApiKey = '00000';
String fakeBaseUrl = 'https://api.abc.com';
UrlBuilder urlBuilder = UrlBuilder(fakeApiKey, fakeBaseUrl);

void main() {

}