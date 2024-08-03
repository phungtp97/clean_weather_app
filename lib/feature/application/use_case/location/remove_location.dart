import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../../domain/domain.dart';

@injectable
class RemoveLocationUseCase extends UseCase<bool, MyLocationEntity> {
  final MyLocationRepository _locationRepository;

  RemoveLocationUseCase(this._locationRepository);

  @override
  Future<Either<Failure, bool>> execute(MyLocationEntity params) {
    return _locationRepository.removeLocation(params);
  }
}