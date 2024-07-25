import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../domain/domain.dart';

@injectable
class GetLocale extends InstantUseCase<Locale, NoParams> {
  final LocaleRepository repository;

  GetLocale({required this.repository});
  @override
  Either<Failure, Locale> execute(NoParams params)  {
    final result = repository.getLocale();
    return Right(result);
  }
}