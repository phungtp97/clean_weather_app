import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../domain.dart';

abstract class MyLocationRepository {
  Future<Either<Failure, List<MyLocationEntity>>> getMyLocation();

  Future<Either<Failure, bool>> saveMyLocation(MyLocationEntity place);

  Future<Either<Failure, bool>> removeLocation(MyLocationEntity place);
}