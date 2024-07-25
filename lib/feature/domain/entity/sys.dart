import 'package:josh_weather/feature/infrastructure/infrastructure.dart';

class SysEntity {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SysEntity({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysEntity.fromModel(SysModel model) {
    return SysEntity(
      type: model.type,
      id: model.id,
      country: model.country,
      sunrise: model.sunrise,
      sunset: model.sunset,
    );
  }
}
