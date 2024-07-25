import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:josh_weather/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/extension/extension.dart';

@module
abstract class InjectableModule {

  SharedPreferences? _prefs;

  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  InternetConnection get internetConnectionChecker =>
      InternetConnection();

  @Named(baseURLStr)
  String get baseUrl => dotenv.env[baseURLStr]!;

  @Named(apiKeyStr)
  String get apiKey => dotenv.env[apiKeyStr]!;

  @singleton
  EventBus get eventBus => EventBus();
  @preResolve
  @singleton
  @Named(authenticatedApiStr)
  Future<Dio> get authenticatedDio async {
    final dio = Dio();

    dio.interceptors.add(DioLogInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (options.method == 'POST') {
            options.headers['Content-Type'] = 'application/json';
          }
          if (_prefs!.token != null &&
              !options.headers.containsKey('Authorization')) {
            options.headers['Authorization'] =
            'Bearer ${_prefs!.token}';
          }
          //NetworkInspector().addLog();
          return handler.next(options);
        }, onResponse: (response, handler) async {
      //NetworkInspector().addLog();
      return handler.next(response);
    }, onError: (e, handler) async {
      //NetworkInspector().addLog();
      return handler.next(e);
    }));
    return dio;
  }

  @Named(publicApiStr)
  @singleton
  Dio get publicDio {
    final dio = Dio();

    return dio;
  }
}