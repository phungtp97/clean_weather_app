// Mocks generated by Mockito 5.4.4 from annotations
// in josh_weather/test/infrastructure/datasource/local_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i3;
import 'package:josh_weather/core/core.dart' as _i5;
import 'package:josh_weather/feature/domain/domain.dart' as _i7;
import 'package:josh_weather/feature/infrastructure/datasource/local/my_location_local_data_source.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSharedPreferences_0 extends _i1.SmartFake
    implements _i2.SharedPreferences {
  _FakeSharedPreferences_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MyLocationLocalDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockMyLocationLocalDataSourceImpl extends _i1.Mock
    implements _i4.MyLocationLocalDataSourceImpl {
  @override
  _i2.SharedPreferences get sharedPreferences => (super.noSuchMethod(
        Invocation.getter(#sharedPreferences),
        returnValue: _FakeSharedPreferences_0(
          this,
          Invocation.getter(#sharedPreferences),
        ),
        returnValueForMissingStub: _FakeSharedPreferences_0(
          this,
          Invocation.getter(#sharedPreferences),
        ),
      ) as _i2.SharedPreferences);

  @override
  _i3.Either<_i5.Failure, _i6.Future<bool>> addLocation(
          _i7.MyLocationEntity? place) =>
      (super.noSuchMethod(
        Invocation.method(
          #addLocation,
          [place],
        ),
        returnValue: _FakeEither_1<_i5.Failure, _i6.Future<bool>>(
          this,
          Invocation.method(
            #addLocation,
            [place],
          ),
        ),
        returnValueForMissingStub: _FakeEither_1<_i5.Failure, _i6.Future<bool>>(
          this,
          Invocation.method(
            #addLocation,
            [place],
          ),
        ),
      ) as _i3.Either<_i5.Failure, _i6.Future<bool>>);

  @override
  _i3.Either<_i5.Failure, List<_i7.MyLocationEntity>> getLocation() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLocation,
          [],
        ),
        returnValue: _FakeEither_1<_i5.Failure, List<_i7.MyLocationEntity>>(
          this,
          Invocation.method(
            #getLocation,
            [],
          ),
        ),
        returnValueForMissingStub:
            _FakeEither_1<_i5.Failure, List<_i7.MyLocationEntity>>(
          this,
          Invocation.method(
            #getLocation,
            [],
          ),
        ),
      ) as _i3.Either<_i5.Failure, List<_i7.MyLocationEntity>>);

  @override
  _i3.Either<_i5.Failure, _i6.Future<bool>> removeLocation(
          _i7.MyLocationEntity? place) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeLocation,
          [place],
        ),
        returnValue: _FakeEither_1<_i5.Failure, _i6.Future<bool>>(
          this,
          Invocation.method(
            #removeLocation,
            [place],
          ),
        ),
        returnValueForMissingStub: _FakeEither_1<_i5.Failure, _i6.Future<bool>>(
          this,
          Invocation.method(
            #removeLocation,
            [place],
          ),
        ),
      ) as _i3.Either<_i5.Failure, _i6.Future<bool>>);
}
