import '../../infrastructure/infrastructure.dart';

class CloudEntity {
  final int all;

  CloudEntity({
    required this.all,
  });

  factory CloudEntity.fromModel(CloudModel model) {
    return CloudEntity(
      all: model.all,
    );
  }
}