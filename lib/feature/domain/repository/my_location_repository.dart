import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../domain.dart';

abstract class MyLocationRepository {
  Future<Either<Failure, List<MyLocationEntity>>> getMyLocation();

  Future<Either<Failure, Future<bool>>> saveMyLocation(MyLocationEntity place);

  Future<Either<Failure, Future<bool>>> removeLocation(MyLocationEntity place);
}