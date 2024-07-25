import '../../infrastructure/infrastructure.dart';

class CoordinateEntity {
  final double latitude;
  final double longitude;

  CoordinateEntity({
    required this.latitude,
    required this.longitude,
  });

  factory CoordinateEntity.fromModel(CoordinateModel model) {
    return CoordinateEntity(
      latitude: model.lat,
      longitude: model.lon,
    );
  }
}