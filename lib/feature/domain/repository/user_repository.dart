import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../domain.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> login(String username, String password);
  Future<Either<Failure, UserEntity>> register(String username, String password);

  Future<Either<Failure, UserEntity>> getMe();
}
