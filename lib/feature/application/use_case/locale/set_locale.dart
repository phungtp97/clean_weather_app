import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../domain/domain.dart';

@injectable
class SetLocale extends UseCase<bool, String> {
  final LocaleRepository repository;
  SetLocale({required this.repository});

  @override
  Future<Either<Failure, bool>> execute(String params) async {
    final result = await repository.setLocale(params);
    return Right(result);
  }
}
