import 'package:equatable/equatable.dart';

class CoordinateModel extends Equatable{
  final double lon;
  final double lat;

  const CoordinateModel({required this.lon, required this.lat});

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      lon: json['lon'],
      lat: json['lat'],
    );
  }

  @override
  List<Object?> get props => [lon, lat];
}
