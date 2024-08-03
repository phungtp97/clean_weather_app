import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:josh_weather/core/core.dart';
import 'package:josh_weather/feature/application/blocs/home/home_bloc.dart';
import 'package:josh_weather/feature/application/blocs/home/home_state.dart';
import 'package:josh_weather/feature/domain/domain.dart';
import 'package:josh_weather/feature/domain/entity/forecast_weather_3_hour.dart';
import 'package:josh_weather/feature/infrastructure/model/model.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/fake_data/get_fake_data.dart';
import '../../../helper/mocks_helper/mocks.mocks.dart';

main() {
  group('HomeBloc Test', () {
    late HomeBloc homeBloc;
    late MockGetWeatherByCoordUseCase mockGetWeatherByCoordUseCase;
    late MockGetLocationUseCase mockGetLocationUseCase;
    late MockRemoveLocationUseCase mockRemoveLocationUseCase;
    late MockGetWeatherForecastByCoordUseCase
        mockGetWeatherForecastByCoordUseCase;
    GetIt.I.registerSingleton(EventBus());
    final myLocations = fakeMyLocations;

    setUp(() {
      mockGetLocationUseCase = MockGetLocationUseCase();
      mockGetWeatherByCoordUseCase = MockGetWeatherByCoordUseCase();
      mockGetWeatherForecastByCoordUseCase =
          MockGetWeatherForecastByCoordUseCase();
      mockRemoveLocationUseCase = MockRemoveLocationUseCase();

      when(mockGetLocationUseCase.execute(NoParams()))
          .thenAnswer((_) async => Right(myLocations));
      when(mockGetWeatherByCoordUseCase.execute(any)).thenAnswer((_) async =>
          Right(WeatherEntity.fromModel(
              CurrentWeatherModel.fromJson(fakeCurrentWeatherJson))));
      when(mockGetWeatherForecastByCoordUseCase.execute(any)).thenAnswer(
          (_) async => Right(ForecastWeather3HourEntity.fromModel(
                  ForecastWeather3HourModel.fromJson(fakeForecastJson))
              .list));
      when(mockRemoveLocationUseCase.execute(any)).thenAnswer((_) async {
        myLocations.removeAt(0);
        return const Right(true);
      });
      homeBloc = HomeBloc(
        getWeatherByCoordUseCase: mockGetWeatherByCoordUseCase,
        getLocationUseCase: mockGetLocationUseCase,
        getWeatherForecastByCoordUseCase: mockGetWeatherForecastByCoordUseCase,
        removeLocationUseCase: mockRemoveLocationUseCase,
      );
    });

    tearDown(() {
      homeBloc.close();
    });
    blocTest<HomeBloc, HomeState>(
      '[getMyLocations selectFirst: true]: should emit locations: []',
      build: () {
        return homeBloc;
      },
      act: (bloc) => bloc.getMyLocations(selectFirst: true),
      expect: () => [
        isA<HomeState>().having((p0) => p0.locations, 'locations', isNotEmpty),
        isA<HomeState>().having((p0) => p0.weather, 'weather', isNotNull),
        isA<HomeState>()
            .having((p0) => p0.dailyForecast, 'dailyForecast', isNotNull),
        isA<HomeState>().having((p0) => p0.fiveDaysForecast, 'fiveDaysForecast',
            isNotNull),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      '[getMyLocations selectFirst: false]: should emit locations: []',
      build: () {
        return homeBloc;
      },
      act: (bloc) => bloc.getMyLocations(selectFirst: false),
      expect: () => [
        isA<HomeState>().having((p0) => p0.locations, 'locations', isNotEmpty),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      '[removeLocation]: should emit locations: []',
      build: () {
        return homeBloc;
      },
      act: (bloc) => bloc.removeLocation(fakeMyLocations.first),
      expect: () => [
        isA<HomeState>().having((p0) => p0.locations, 'locations', isEmpty),
      ],
    );
  });
}
