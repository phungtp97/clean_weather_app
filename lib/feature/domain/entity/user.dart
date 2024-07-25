import '../../infrastructure/infrastructure.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  UserEntity._(this.id, this.name, this.email, this.photoUrl);

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      photoUrl: model.photoUrl,
    );
  }
}