class WindModel {
  final num speed;
  final num deg;
  final num? gust;

  WindModel({required this.speed, required this.deg, this.gust});

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }
}