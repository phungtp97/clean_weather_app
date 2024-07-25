import 'package:josh_weather/feature/infrastructure/infrastructure.dart';

class RainEntity {
  RainEntity({this.h1, this.h3});

  final num? h1;
  final num? h3;

  factory RainEntity.fromModel(RainModel model) {
    return RainEntity(
      h1: model.h1,
      h3: model.h3
    );
  }
}
