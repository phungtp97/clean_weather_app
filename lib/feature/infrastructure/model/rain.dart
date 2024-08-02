import 'package:equatable/equatable.dart';

class RainModel extends Equatable{
  final num? h1;
  final num? h3;

  const RainModel({this.h1, this.h3});

  factory RainModel.fromJson(Map<String, dynamic> json) {
    return RainModel(
      h1: json['1h'],
      h3: json['3h'],
    );
  }

  @override
  List<Object?> get props => [h1, h3];
}
