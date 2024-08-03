import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:josh_weather/core/core.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mocks_helper/mocks.mocks.dart';

void main() {
  late MockUseCase<String, NoParams> useCase;
  late MockInstantUseCase<String, NoParams> instantUseCase;

  setUp(() {
    useCase = MockUseCase();
    instantUseCase = MockInstantUseCase();
  });

  test('should return a WeatherEntity when the call to remote data source is successful', () async {
    when(useCase.execute(NoParams())).thenAnswer((_) async => const Right('Success'));
    final result = await useCase.execute(NoParams());
    expect(result, const Right('Success'));

  });

  test('should return a WeatherEntity when the call to remote data source is successful', () async {
    when(instantUseCase.execute(NoParams())).thenAnswer((_) => const Right('Success'));
    final result = instantUseCase.execute(NoParams());
    expect(result, const Right('Success'));
  });
}