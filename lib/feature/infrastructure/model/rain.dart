class RainModel {
  final num? h1;
  final num? h3;

  RainModel({this.h1, this.h3});

  factory RainModel.fromJson(Map<String, dynamic> json) {
    return RainModel(
      h1: json['1h'],
      h3: json['3h'],
    );
  }
}
