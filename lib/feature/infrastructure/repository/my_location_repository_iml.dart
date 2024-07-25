import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import '../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasource/data_source.dart';

@Singleton(as: MyLocationRepository)
class MyLocationRepositoryImpl implements MyLocationRepository {
  final MyLocationLocalDataSource myLocationDataSource;

  MyLocationRepositoryImpl(this.myLocationDataSource);

  @override
  Future<Either<Failure, Future<bool>>> saveMyLocation(MyLocationEntity place) async {
    return myLocationDataSource.addLocation(place).fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, List<MyLocationEntity>>> getMyLocation() async {
    return myLocationDataSource.getLocation().fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, Future<bool>>> removeLocation(MyLocationEntity place) async {
    return myLocationDataSource.removeLocation(place).fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}