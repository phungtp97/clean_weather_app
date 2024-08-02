import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final int id;
  final String description;
  final String main;
  final String icon;
  WeatherModel({required this.id, required this.description, required this.main, required this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      description: json['description'],
      main: json['main'],
      icon: json['icon'],
    );
  }

  @override
  List<Object?> get props => [id, description, main, icon];
}