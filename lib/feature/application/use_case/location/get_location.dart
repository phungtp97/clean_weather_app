import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../../domain/domain.dart';

@injectable
class GetLocationUseCase extends UseCase<List<MyLocationEntity>, NoParams> {
  final MyLocationRepository _locationRepository;

  GetLocationUseCase(this._locationRepository);

  @override
  Future<Either<Failure, List<MyLocationEntity>>> execute(NoParams params) {
    return _locationRepository.getMyLocation();
  }
}