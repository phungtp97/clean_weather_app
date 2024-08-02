import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:josh_weather/feature/domain/domain.dart';
import 'package:josh_weather/feature/infrastructure/datasource/data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MyLocationLocalDataSourceImpl>()])

void main() {
  late MockMyLocationLocalDataSourceImpl mockMyLocationLocalDataSourceImpl;

  final locations = [MyLocationEntity(
    placemark: const Placemark(
      name: 'Jakarta',
      street: 'Jalan Sudirman',
      subLocality: 'Jakarta Selatan',
      locality: 'Jakarta',
      administrativeArea: 'DKI Jakarta',
      postalCode: '12345',
      country: 'Indonesia',
      isoCountryCode: 'ID',
    ),
    location: Location(
      timestamp: DateTime.now(),
      latitude: -6.2146,
      longitude: 106.8451,
    ),
  )];

  setUp(() {
    mockMyLocationLocalDataSourceImpl = MockMyLocationLocalDataSourceImpl();
  });

  test('should return a list of MyLocationEntity when the call to local data source is successful', () async {
    // arrange

    when(mockMyLocationLocalDataSourceImpl.getLocation()).thenAnswer((_) => Right(locations));
    // act
    final result = mockMyLocationLocalDataSourceImpl.getLocation();
    // assert
    expect(result, Right(locations));
  });

  test('should return a list of MyLocationEntity when the call to local data source is successful', () async {
    // arrange
    when(mockMyLocationLocalDataSourceImpl.addLocation(locations.first)).thenAnswer((_) => Right(Future.value(true)));
    // act
    final result = mockMyLocationLocalDataSourceImpl.addLocation(locations.first);
    // assert
    expect(result, Right(Future.value(true)));
  });

  test('should return a list of MyLocationEntity when the call to local data source is successful', () async {
    // arrange
    when(mockMyLocationLocalDataSourceImpl.removeLocation(locations.first)).thenAnswer((_) => Right(Future.value(true)));
    // act
    final result = mockMyLocationLocalDataSourceImpl.removeLocation(locations.first);
    // assert
    expect(result, Right(Future.value(true)));
  });
}
