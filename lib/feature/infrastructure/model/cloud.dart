class CloudModel {
  final int all;

  CloudModel({required this.all});

  factory CloudModel.fromJson(Map<String, dynamic> json) {
    return CloudModel(
      all: json['all'],
    );
  }
}