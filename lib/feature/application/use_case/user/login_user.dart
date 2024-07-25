import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../domain/domain.dart';

@injectable
class LoginUser extends UseCase<UserEntity, LoginUserParams> {
  final UserRepository _userRepository;

  LoginUser(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> execute(LoginUserParams params) {
    return _userRepository.login(params.username, params.password);
  }
}

class LoginUserParams {
  final String username;
  final String password;

  LoginUserParams({required this.username, required this.password});
}