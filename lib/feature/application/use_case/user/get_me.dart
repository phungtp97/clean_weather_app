import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../../domain/domain.dart';

@injectable
class GetMe extends UseCase<UserEntity, NoParams> {
  final UserRepository _userRepository;

  GetMe(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> execute(NoParams params) {
    return _userRepository.getMe();
  }
}