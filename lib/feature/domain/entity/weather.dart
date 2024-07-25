import '../../infrastructure/infrastructure.dart';
import '../domain.dart';

class WeatherEntity {
  final CoordinateEntity? coordinate;
  final int id;
  final String description;
  final WeatherMainEntity main;
  final int visibility;
  final WindEntity? wind;
  final RainEntity? rain;
  final CloudEntity? cloud;
  final int dt;
  final int? timezone;
  final String? name;
  final SysEntity? sys;
  final num? pop;
  final String icon;

  WeatherEntity(
      {this.coordinate,
      required this.id,
      required this.description,
      required this.main,
      required this.visibility,
      required this.icon,
      this.wind,
      this.rain,
      this.cloud,
      required this.dt,
      this.sys,
      this.pop,
      required this.timezone,
      required this.name});

  factory WeatherEntity.fromModel(CurrentWeatherModel model) {
    return WeatherEntity(
      coordinate: model.coordinate == null
          ? null
          : CoordinateEntity.fromModel(model.coordinate!),
      id: model.weather[0].id,
      description: model.weather[0].description,
      main: WeatherMainEntity.fromModel(model.main),
      visibility: model.visibility,
      wind: model.wind == null ? null : WindEntity.fromModel(model.wind!),
      rain: model.rain == null ? null : RainEntity.fromModel(model.rain!),
      cloud: model.cloud == null ? null : CloudEntity.fromModel(model.cloud!),
      dt: model.dt,
      timezone: model.timezone,
      name: model.name,
      pop: model.pop,
      sys: model.sys == null ? null : SysEntity.fromModel(model.sys!),
      icon: model.weather[0].icon,
    );
  }
}
