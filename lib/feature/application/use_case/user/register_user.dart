import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../../domain/domain.dart';

@injectable
class RegisterUser implements UseCase<UserEntity, RegisterUserParams> {
  final UserRepository _userRepository;

  RegisterUser(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> execute(RegisterUserParams params) async {
    return _userRepository.register(params.username, params.password);
  }
}

class RegisterUserParams {
  final String username;
  final String password;

  RegisterUserParams({required this.username, required this.password});
}