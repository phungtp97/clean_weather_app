import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../application.dart';

@injectable
class GetWeatherFiveDaysForecastByCoordUseCase extends UseCase<List<WeatherEntity>, CoordinateParams> {
  final WeatherRepository repository;

  GetWeatherFiveDaysForecastByCoordUseCase({required this.repository});
  @override
  Future<Either<Failure, List<WeatherEntity>>> execute(CoordinateParams params) {
    return repository.getWeatherForecastFiveDaysByCoord(params.lat, params.lon);
  }
}