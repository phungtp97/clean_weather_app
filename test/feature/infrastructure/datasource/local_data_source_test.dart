import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:josh_weather/feature/domain/domain.dart';
import 'package:josh_weather/feature/infrastructure/infrastructure.dart';
import 'package:josh_weather/shared/shared.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/fake_data/get_fake_data.dart';
import '../../../helper/json_reader.dart';
import '../../../helper/mocks_helper/mocks.mocks.dart';

void main() {
  MockSharedPreferences sharedPreferences = MockSharedPreferences();
  late MyLocationLocalDataSourceImpl myLocationLocalDataSource;

  setUp(() {
    myLocationLocalDataSource =
        MyLocationLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  });
  final myLocations = fakeMyLocations;
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
}
