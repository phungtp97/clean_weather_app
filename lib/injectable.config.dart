// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_bus/event_bus.dart' as _i4;
import 'package:flutter/material.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i5;
import 'package:josh_weather/core/core.dart' as _i8;
import 'package:josh_weather/core/module/inject_module.dart' as _i32;
import 'package:josh_weather/core/network/network_info.dart' as _i6;
import 'package:josh_weather/feature/application/application.dart' as _i27;
import 'package:josh_weather/feature/application/blocs/add_location/add_location_bloc.dart'
    as _i26;
import 'package:josh_weather/feature/application/blocs/app/app_bloc.dart'
    as _i31;
import 'package:josh_weather/feature/application/blocs/home/home_bloc.dart'
    as _i30;
import 'package:josh_weather/feature/application/use_case/locale/get_locale.dart'
    as _i28;
import 'package:josh_weather/feature/application/use_case/locale/set_locale.dart'
    as _i25;
import 'package:josh_weather/feature/application/use_case/location/get_location.dart'
    as _i29;
import 'package:josh_weather/feature/application/use_case/location/remove_location.dart'
    as _i23;
import 'package:josh_weather/feature/application/use_case/location/save_location.dart'
    as _i24;
import 'package:josh_weather/feature/application/use_case/weather/get_weather_by_coord.dart'
    as _i15;
import 'package:josh_weather/feature/application/use_case/weather/get_weather_forecast_by_coord.dart'
    as _i16;
import 'package:josh_weather/feature/domain/domain.dart' as _i10;
import 'package:josh_weather/feature/domain/repository/local_repository.dart'
    as _i18;
import 'package:josh_weather/feature/infrastructure/datasource/data_source.dart'
    as _i22;
import 'package:josh_weather/feature/infrastructure/datasource/local/locale_local_data_source.dart'
    as _i17;
import 'package:josh_weather/feature/infrastructure/datasource/local/my_location_local_data_source.dart'
    as _i20;
import 'package:josh_weather/feature/infrastructure/datasource/remote/weather_remote_data_source.dart'
    as _i9;
import 'package:josh_weather/feature/infrastructure/repository/locale_repository_iml.dart'
    as _i19;
import 'package:josh_weather/feature/infrastructure/repository/my_location_repository_iml.dart'
    as _i21;
import 'package:josh_weather/feature/infrastructure/repository/weather_repository_iml.dart'
    as _i11;
import 'package:josh_weather/feature/presentation/pages/add_location/add_location_page.dart'
    as _i14;
import 'package:josh_weather/feature/presentation/pages/home/home_page.dart'
    as _i13;
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
      instanceName: 'MAIN_DIO',
      preResolve: true,
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
      () => injectableModule.baseUrl,
      instanceName: 'BASE_URL',
    );
    gh.factory<String>(
      () => injectableModule.apiKey,
      instanceName: 'API_KEY',
    );
    gh.factory<_i8.UrlBuilder>(
      () => injectableModule.urlBuilder,
      instanceName: 'URL_BUILDER',
    );
    gh.singleton<_i9.WeatherRemoteDataSource>(
        () => _i9.WeatherRemoteDataSourceIml(
              urlBuilder: gh<_i8.UrlBuilder>(instanceName: 'URL_BUILDER'),
              userDio: gh<_i3.Dio>(instanceName: 'MAIN_DIO'),
            ));
    gh.lazySingleton<_i10.WeatherRepository>(() => _i11.WeatherRepositoryIml(
        weatherRemoteDataSource: gh<_i9.WeatherRemoteDataSource>()));
    gh.factory<_i12.Widget>(
      () => const _i13.HomePage(),
      instanceName: '/home',
    );
    gh.factory<_i12.Widget>(
      () => const _i14.AddLocationPage(),
      instanceName: '/add_location',
    );
    gh.factory<_i15.GetWeatherByCoordUseCase>(() =>
        _i15.GetWeatherByCoordUseCase(
            repository: gh<_i10.WeatherRepository>()));
    gh.factory<_i16.GetWeatherForecastByCoordUseCase>(() =>
        _i16.GetWeatherForecastByCoordUseCase(
            repository: gh<_i10.WeatherRepository>()));
    gh.singleton<_i17.LocaleLocalDataSource>(() =>
        _i17.LocaleLocalDataSourceImpl(
            sharedPreferences: gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i18.LocaleRepository>(() => _i19.LocaleRepositoryIml(
        sharedPreferences: gh<_i7.SharedPreferences>()));
    gh.singleton<_i20.MyLocationLocalDataSource>(() =>
        _i20.MyLocationLocalDataSourceImpl(
            sharedPreferences: gh<_i7.SharedPreferences>()));
    gh.singleton<_i10.MyLocationRepository>(() =>
        _i21.MyLocationRepositoryImpl(gh<_i22.MyLocationLocalDataSource>()));
    gh.factory<_i23.RemoveLocationUseCase>(
        () => _i23.RemoveLocationUseCase(gh<_i10.MyLocationRepository>()));
    gh.factory<_i24.SaveLocationUseCase>(
        () => _i24.SaveLocationUseCase(gh<_i10.MyLocationRepository>()));
    gh.factory<_i25.SetLocale>(
        () => _i25.SetLocale(repository: gh<_i10.LocaleRepository>()));
    gh.factory<_i26.AddLocationBloc>(
        () => _i26.AddLocationBloc(gh<_i27.SaveLocationUseCase>()));
    gh.factory<_i28.GetLocale>(
        () => _i28.GetLocale(repository: gh<_i10.LocaleRepository>()));
    gh.factory<_i29.GetLocationUseCase>(
        () => _i29.GetLocationUseCase(gh<_i10.MyLocationRepository>()));
    gh.factory<_i30.HomeBloc>(() => _i30.HomeBloc(
          getWeatherByCoordUseCase: gh<_i27.GetWeatherByCoordUseCase>(),
          getLocationUseCase: gh<_i27.GetLocationUseCase>(),
          removeLocationUseCase: gh<_i27.RemoveLocationUseCase>(),
          getWeatherForecastByCoordUseCase:
              gh<_i27.GetWeatherForecastByCoordUseCase>(),
        ));
    gh.singleton<_i31.AppBloc>(
      () => _i31.AppBloc(
        setLocaleUseCase: gh<_i27.SetLocale>(),
        getLocaleUseCase: gh<_i27.GetLocale>(),
      ),
      dispose: (i) => i.dispose(),
    );
    return this;
  }
}

class _$InjectableModule extends _i32.InjectableModule {}
