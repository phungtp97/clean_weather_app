import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../../domain/domain.dart';

abstract class MyLocationLocalDataSource {
  Either<Failure, List<MyLocationEntity>> getLocation();

  Future<Either<Failure, bool>> removeLocation(MyLocationEntity place);

  Future<Either<Failure, bool>> addLocation(MyLocationEntity place);
}

@Singleton(as: MyLocationLocalDataSource)
class MyLocationLocalDataSourceImpl implements MyLocationLocalDataSource {
  final SharedPreferences sharedPreferences;

  MyLocationLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Either<Failure, bool>> addLocation(MyLocationEntity place) async {
    return getLocation().fold((l) {
      return Left(l);
    }, (r) async {
      final List<MyLocationEntity> newList = List.from(r);
      if (!newList.contains(place)) {
        newList.add(place);
        await sharedPreferences.setString(
            SharedPreferencesKey.placeMarksKey,
            json.encode({
              SharedPreferencesKey.placeMarksKey:
              newList.map<Map<String, dynamic>>((e) => e.toMap()).toList()
            }));
        var locations = getLocation();
        return const Right(true);
      } else {
        return const Right(true);
      }
    });
  }

  @override
  Either<Failure, List<MyLocationEntity>> getLocation() {
    final jsonStr =
        sharedPreferences.getString(SharedPreferencesKey.placeMarksKey) ?? '';
    if (jsonStr.isEmpty) {
      sharedPreferences.setString(SharedPreferencesKey.placeMarksKey,
          json.encode({SharedPreferencesKey.placeMarksKey: []}));
      return const Right([]);
    } else {
      final jsonMap = json.decode(jsonStr);
      try {
        final placeMarkers =
            jsonMap[SharedPreferencesKey.placeMarksKey] as List;
        return Right(
            placeMarkers.map((e) => MyLocationEntity.fromMap(e)).toList());
      } catch (e) {
        sharedPreferences.setString(SharedPreferencesKey.placeMarksKey,
            json.encode({SharedPreferencesKey.placeMarksKey: []}));
        return const Right([]);
      }
    }
  }

  @override
  Future<Either<Failure, bool>> removeLocation(MyLocationEntity place) async {
    final currentPlaceMarks = getLocation();
    return getLocation().fold((l) {
      return Left(l);
    }, (r) async {
      final List<MyLocationEntity> newList = List.from(r);
      if (newList.contains(place)) {
        newList.remove(place);
        return Right(await sharedPreferences.setString(
            SharedPreferencesKey.placeMarksKey,
            json.encode({
              SharedPreferencesKey.placeMarksKey:
              newList.map<Map<String, dynamic>>((e) => e.toMap()).toList()
            })));
      } else {
        return const Right(true);
      }
    });
  }
}
