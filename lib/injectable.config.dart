// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_bus/event_bus.dart' as _i4;
import 'package:flutter/material.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i5;
import 'package:josh_weather/core/module/inject_module.dart' as _i39;
import 'package:josh_weather/core/network/network_info.dart' as _i6;
import 'package:josh_weather/feature/application/application.dart' as _i33;
import 'package:josh_weather/feature/application/blocs/add_location/add_location_bloc.dart'
    as _i32;
import 'package:josh_weather/feature/application/blocs/app/app_bloc.dart'
    as _i38;
import 'package:josh_weather/feature/application/blocs/auth/auth_bloc.dart'
    as _i34;
import 'package:josh_weather/feature/application/blocs/home/home_bloc.dart'
    as _i37;
import 'package:josh_weather/feature/application/use_case/locale/get_locale.dart'
    as _i35;
import 'package:josh_weather/feature/application/use_case/locale/set_locale.dart'
    as _i31;
import 'package:josh_weather/feature/application/use_case/location/get_location.dart'
    as _i36;
import 'package:josh_weather/feature/application/use_case/location/remove_location.dart'
    as _i29;
import 'package:josh_weather/feature/application/use_case/location/save_location.dart'
    as _i30;
import 'package:josh_weather/feature/application/use_case/user/get_me.dart'
    as _i17;
import 'package:josh_weather/feature/application/use_case/user/login_user.dart'
    as _i24;
import 'package:josh_weather/feature/application/use_case/user/register_user.dart'
    as _i28;
import 'package:josh_weather/feature/application/use_case/weather/get_weather_by_coord.dart'
    as _i18;
import 'package:josh_weather/feature/application/use_case/weather/get_weather_five_days_forecast_by_coord.dart'
    as _i19;
import 'package:josh_weather/feature/application/use_case/weather/get_weather_forecast_by_coord.dart'
    as _i20;
import 'package:josh_weather/feature/domain/domain.dart' as _i9;
import 'package:josh_weather/feature/domain/repository/local_repository.dart'
    as _i22;
import 'package:josh_weather/feature/infrastructure/datasource/data_source.dart'
    as _i27;
import 'package:josh_weather/feature/infrastructure/datasource/local/locale_local_data_source.dart'
    as _i21;
import 'package:josh_weather/feature/infrastructure/datasource/local/my_location_local_data_source.dart'
    as _i25;
import 'package:josh_weather/feature/infrastructure/datasource/remote/user_remote_data_source.dart'
    as _i8;
import 'package:josh_weather/feature/infrastructure/datasource/remote/weather_remote_data_source.dart'
    as _i12;
import 'package:josh_weather/feature/infrastructure/infrastructure.dart'
    as _i11;
import 'package:josh_weather/feature/infrastructure/repository/locale_repository_iml.dart'
    as _i23;
import 'package:josh_weather/feature/infrastructure/repository/my_location_repository_iml.dart'
    as _i26;
import 'package:josh_weather/feature/infrastructure/repository/user_repository_iml.dart'
    as _i10;
import 'package:josh_weather/feature/infrastructure/repository/weather_repository_iml.dart'
    as _i13;
import 'package:josh_weather/feature/presentation/pages/add_location/add_location_page.dart'
    as _i15;
import 'package:josh_weather/feature/presentation/pages/home/home_page.dart'
    as _i16;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    await gh.singletonAsync<_i3.Dio>(
      () => injectableModule.authenticatedDio,
      instanceName: 'AUTHENTICATED_API',
      preResolve: true,
    );
    gh.singleton<_i3.Dio>(
      () => injectableModule.publicDio,
      instanceName: 'PUBLIC_API',
    );
    gh.singleton<_i4.EventBus>(() => injectableModule.eventBus);
    gh.singleton<_i5.InternetConnection>(
        () => injectableModule.internetConnectionChecker);
    gh.singleton<_i6.NetworkInfo>(
        () => _i6.NetworkInfo(gh<_i5.InternetConnection>()));
    await gh.singletonAsync<_i7.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.factory<String>(
      () => injectableModule.apiKey,
      instanceName: 'API_KEY',
    );
    gh.factory<String>(
      () => injectableModule.baseUrl,
      instanceName: 'BASE_URL',
    );
    gh.singleton<_i8.UserRemoteDataSource>(() => _i8.UserRemoteDataSourceImpl(
          prefServices: gh<_i7.SharedPreferences>(),
          baseUrl: gh<String>(instanceName: 'BASE_URL'),
          userDio: gh<_i3.Dio>(instanceName: 'AUTHENTICATED_API'),
          publicDio: gh<_i3.Dio>(instanceName: 'PUBLIC_API'),
        ));
    gh.lazySingleton<_i9.UserRepository>(() => _i10.UserRepositoryIml(
        userRemoteDataSource: gh<_i11.UserRemoteDataSource>()));
    gh.singleton<_i12.WeatherRemoteDataSource>(
        () => _i12.WeatherRemoteDataSourceIml(
              prefServices: gh<_i7.SharedPreferences>(),
              apiKey: gh<String>(instanceName: 'API_KEY'),
              baseUrl: gh<String>(instanceName: 'BASE_URL'),
              userDio: gh<_i3.Dio>(instanceName: 'AUTHENTICATED_API'),
              publicDio: gh<_i3.Dio>(instanceName: 'PUBLIC_API'),
            ));
    gh.lazySingleton<_i9.WeatherRepository>(() => _i13.WeatherRepositoryIml(
        weatherRemoteDataSource: gh<_i12.WeatherRemoteDataSource>()));
    gh.factory<_i14.Widget>(
      () => const _i15.AddLocationPage(),
      instanceName: '/add_location',
    );
    gh.factory<_i14.Widget>(
      () => const _i16.HomePage(),
      instanceName: '/home',
    );
    gh.factory<_i17.GetMe>(() => _i17.GetMe(gh<_i9.UserRepository>()));
    gh.factory<_i18.GetWeatherByCoordUseCase>(() =>
        _i18.GetWeatherByCoordUseCase(repository: gh<_i9.WeatherRepository>()));
    gh.factory<_i19.GetWeatherFiveDaysForecastByCoordUseCase>(() =>
        _i19.GetWeatherFiveDaysForecastByCoordUseCase(
            repository: gh<_i9.WeatherRepository>()));
    gh.factory<_i20.GetWeatherForecastByCoordUseCase>(() =>
        _i20.GetWeatherForecastByCoordUseCase(
            repository: gh<_i9.WeatherRepository>()));
    gh.singleton<_i21.LocaleLocalDataSource>(() =>
        _i21.LocaleLocalDataSourceImpl(
            sharedPreferences: gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i22.LocaleRepository>(() => _i23.LocaleRepositoryIml(
        sharedPreferences: gh<_i7.SharedPreferences>()));
    gh.factory<_i24.LoginUser>(() => _i24.LoginUser(gh<_i9.UserRepository>()));
    gh.singleton<_i25.MyLocationLocalDataSource>(() =>
        _i25.MyLocationLocalDataSourceImpl(
            sharedPreferences: gh<_i7.SharedPreferences>()));
    gh.singleton<_i9.MyLocationRepository>(() =>
        _i26.MyLocationRepositoryImpl(gh<_i27.MyLocationLocalDataSource>()));
    gh.factory<_i28.RegisterUser>(
        () => _i28.RegisterUser(gh<_i9.UserRepository>()));
    gh.factory<_i29.RemoveLocationUseCase>(
        () => _i29.RemoveLocationUseCase(gh<_i9.MyLocationRepository>()));
    gh.factory<_i30.SaveLocationUseCase>(
        () => _i30.SaveLocationUseCase(gh<_i9.MyLocationRepository>()));
    gh.factory<_i31.SetLocale>(
        () => _i31.SetLocale(repository: gh<_i9.LocaleRepository>()));
    gh.factory<_i32.AddLocationBloc>(
        () => _i32.AddLocationBloc(gh<_i33.SaveLocationUseCase>()));
    gh.factory<_i34.AuthBloc>(() => _i34.AuthBloc(
          gh<_i33.LoginUser>(),
          gh<_i33.RegisterUser>(),
        ));
    gh.factory<_i35.GetLocale>(
        () => _i35.GetLocale(repository: gh<_i9.LocaleRepository>()));
    gh.factory<_i36.GetLocationUseCase>(
        () => _i36.GetLocationUseCase(gh<_i9.MyLocationRepository>()));
    gh.factory<_i37.HomeBloc>(() => _i37.HomeBloc(
          getWeatherByCoordUseCase: gh<_i33.GetWeatherByCoordUseCase>(),
          getLocationUseCase: gh<_i33.GetLocationUseCase>(),
          getWeatherFiveDaysForecastByCoordUseCase:
              gh<_i33.GetWeatherFiveDaysForecastByCoordUseCase>(),
          removeLocationUseCase: gh<_i33.RemoveLocationUseCase>(),
          getWeatherForecastByCoordUseCase:
              gh<_i33.GetWeatherForecastByCoordUseCase>(),
        ));
    gh.singleton<_i38.AppBloc>(
      () => _i38.AppBloc(
        setLocaleUseCase: gh<_i33.SetLocale>(),
        getLocaleUseCase: gh<_i33.GetLocale>(),
        getMeUseCase: gh<_i33.GetMe>(),
      ),
      dispose: (i) => i.dispose(),
    );
    return this;
  }
}

class _$InjectableModule extends _i39.InjectableModule {}
