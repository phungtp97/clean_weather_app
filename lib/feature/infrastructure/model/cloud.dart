import 'package:equatable/equatable.dart';

class CloudModel extends Equatable{
  final int all;

  const CloudModel({required this.all});

  factory CloudModel.fromJson(Map<String, dynamic> json) {
    return CloudModel(
      all: json['all'],
    );
  }

  @override
  List<Object?> get props => [all];
}