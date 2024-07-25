import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../application.dart';

@injectable
class GetWeatherForecastByCoordUseCase extends UseCase<List<WeatherEntity>, CoordinateParams> {
  final WeatherRepository repository;

  GetWeatherForecastByCoordUseCase({required this.repository});
  @override
  Future<Either<Failure, List<WeatherEntity>>> execute(CoordinateParams params) {
    return repository.getWeatherForecast3HourByCoord(params.lat, params.lon);
  }
}