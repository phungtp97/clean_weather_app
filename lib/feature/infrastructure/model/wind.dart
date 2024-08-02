import 'package:equatable/equatable.dart';

class WindModel extends Equatable {
  final num speed;
  final num deg;
  final num? gust;

  const WindModel({required this.speed, required this.deg, this.gust});

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }

  @override
  List<Object?> get props => [speed, deg, gust];
}