import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:josh_weather/feature/domain/domain.dart';
import 'package:josh_weather/feature/infrastructure/infrastructure.dart';
import 'package:josh_weather/shared/shared.dart';
import 'package:mockito/mockito.dart';

import '../../helper/json_reader.dart';
import '../../helper/mocks_helper/mocks.mocks.dart';

void main() {
  MockSharedPreferences sharedPreferences = MockSharedPreferences();
  late MyLocationLocalDataSourceImpl myLocationLocalDataSource;

  setUp(() {
    myLocationLocalDataSource =
        MyLocationLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  });
  final myLocations = (json.decode(readJson('helper/fake_data/fake_my_locations.json'))[SharedPreferencesKey.placeMarksKey] as List<dynamic>).map((e) => MyLocationEntity.fromMap(e)).toList();
  test(
      'should return a list of MyLocationEntity when the call to local data source is successful',
      () async {
    // arrange
    when(sharedPreferences.getString(SharedPreferencesKey.placeMarksKey))
        .thenAnswer((_) => readJson('helper/fake_data/fake_my_locations.json'));
    // act
    final result = myLocationLocalDataSource.getLocation();
    // assert
    result.fold((l) => fail(l.toString()), (r) => expect(r, myLocations));
  });

  test(
      'should return empty when remove location',
      () async {
    // arrange
    when(sharedPreferences.getString(SharedPreferencesKey.placeMarksKey))
        .thenAnswer((_) => readJson('helper/fake_data/fake_my_locations.json'));

    when(sharedPreferences.setString(SharedPreferencesKey.placeMarksKey, json.encode({'placeMarks': []})))
        .thenAnswer((_) => Future.value(true));

    // act
    final result = myLocationLocalDataSource.removeLocation(myLocations.first);
    final result2 = myLocationLocalDataSource.getLocation();
    // assert
    result2.fold((l) => fail(l.toString()), (r) => expect(r, []));
  });

  test(
      'should return a list of 2 MyLocationEntity when add location successful',
      () async {
    // arrange
    when(sharedPreferences.getString(SharedPreferencesKey.placeMarksKey))
        .thenAnswer((_) => readJson('helper/fake_data/fake_my_locations.json'));

    final newLocation = MyLocationEntity.fromMap(json.decode(readJson('helper/fake_data/fake_new_location.json')));
    final newLocations = myLocations..add(newLocation);
    when(sharedPreferences.setString(SharedPreferencesKey.placeMarksKey, json.encode({'placeMarks': myLocations..addAll(newLocations.toList())})))
        .thenAnswer((_) => Future.value(true));
    // act
    final result = myLocationLocalDataSource.getLocation();
    // assert
    result.fold((l) => fail(l.toString()), (r) => expect(r.length, 2));
  });
}
