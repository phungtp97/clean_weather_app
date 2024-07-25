import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../application.dart';

@injectable
class GetWeatherByCoordUseCase extends UseCase<WeatherEntity, CoordinateParams> {
  final WeatherRepository repository;

  GetWeatherByCoordUseCase({required this.repository});
  @override
  Future<Either<Failure, WeatherEntity>> execute(CoordinateParams params) {
    return repository.getWeatherByCoord(params.lat, params.lon);
  }
}