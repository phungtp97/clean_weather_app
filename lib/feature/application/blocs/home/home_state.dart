import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

class HomeState extends Equatable {
  final WeatherEntity? weather;

  final List<WeatherEntity>? dailyForecast;

  final List<WeatherEntity>? fiveDaysForecast;

  final List<MyLocationEntity>? locations;

  final MyLocationEntity? selectedLocation;

  const HomeState({
    this.weather,
    this.dailyForecast,
    this.fiveDaysForecast,
    this.locations,
    this.selectedLocation,
  });

  HomeState copyWith({
    WeatherEntity? weather,
    List<WeatherEntity>? dailyForecast,
    List<WeatherEntity>? fiveDaysForecast,
    List<MyLocationEntity>? locations,
    MyLocationEntity? selectedLocation,
  }) {
    return HomeState(
      weather: weather ?? this.weather,
      dailyForecast: dailyForecast ?? this.dailyForecast,
      fiveDaysForecast: fiveDaysForecast ?? this.fiveDaysForecast,
      locations: locations ?? this.locations,
      selectedLocation: selectedLocation ?? this.selectedLocation,
    );
  }

  HomeState clearWeather({MyLocationEntity? selectedLocation,}) {
    return HomeState(
      locations: locations,
      selectedLocation: selectedLocation ?? this.selectedLocation,
    );
  }

  @override
  List<Object?> get props => [weather, dailyForecast, fiveDaysForecast, locations, selectedLocation];
}
