class CoordinateModel {
  final double lon;
  final double lat;

  CoordinateModel({required this.lon, required this.lat});

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}
