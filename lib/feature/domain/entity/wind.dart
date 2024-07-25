import 'package:josh_weather/feature/infrastructure/infrastructure.dart';

class WindEntity {
  final num speed;
  final num deg;

  WindEntity({
    required this.speed,
    required this.deg,
  });

  factory WindEntity.fromModel(WindModel model) {
    return WindEntity(
      speed: model.speed,
      deg: model.deg,
    );
  }
}