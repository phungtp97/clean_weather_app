import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryIml extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryIml({
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login(
      String username, String password) async {
    final either = await userRemoteDataSource.login(username, password);
    return either.fold(
          (l) => Left(l),
          (r) => Right(UserEntity.fromModel(r)),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> register(
      String username, String password) async {
    final either = await userRemoteDataSource.register(username, password);
    return either.fold(
          (l) => Left(l),
          (r) => Right(UserEntity.fromModel(r)),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> getMe() async {
    final either = await userRemoteDataSource.getMe();
    return either.fold(
          (l) => Left(l),
          (r) => Right(UserEntity.fromModel(r)),
    );
  }
}