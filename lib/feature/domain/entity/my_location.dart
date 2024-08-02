import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';

class MyLocationEntity extends Equatable {
  final Location location;
  final Placemark placemark;

  const MyLocationEntity({
    required this.location,
    required this.placemark,
  });

  factory MyLocationEntity.fromMap(Map<String, dynamic> map) {
    return MyLocationEntity(
      location: Location.fromMap(map['location']),
      placemark: Placemark.fromMap(map['placemark']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'location': location.toJson(),
      'placemark': placemark.toJson(),
    };
  }

  @override
  List<Object?> get props => [location.toJson(), placemark.toJson()];
}