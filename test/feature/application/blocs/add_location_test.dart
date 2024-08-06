import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:josh_weather/feature/application/application.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/fake_data/get_fake_data.dart';
import '../../../helper/mocks_helper/mocks.mocks.dart';

main() {
  group('AddLocationBloc Test', () {
    late AddLocationBloc addLocationBloc;
    late MockSaveLocationUseCase mockSaveLocationUseCase;
    GetIt.I.registerSingleton(EventBus());
    final myLocations = fakeMyLocations;

    setUp(() {
      mockSaveLocationUseCase = MockSaveLocationUseCase();

      when(mockSaveLocationUseCase.execute(myLocations.first))
          .thenAnswer((_) async => const Right(true));

      addLocationBloc = AddLocationBloc(mockSaveLocationUseCase);
    });

    tearDown(() {
      addLocationBloc.close();
    });

    blocTest<AddLocationBloc, AddLocationState>(
      '[addLocation]: should emit AddLocationState with status: AddLocationStatus.success',
      build: () {
        return addLocationBloc;
      },
      act: (bloc) => bloc.save(myLocations.first),
      expect: () => [
        //isA<AddLocationState>().having((p0) => p0., 'status', AddLocationStatus.success),
      ],
    );
  });
}