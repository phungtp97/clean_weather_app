import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/extension/extension.dart';
import '../../../../core/core.dart';
import '../../../../shared/global/global.dart';
import '../../infrastructure.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, UserModel>> login(String username, String password);

  Future<Either<Failure, UserModel>> register(String username, String password);

  Future<Either<Failure, UserModel>> getMe();
}

@Singleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final SharedPreferences _prefServices;

  final String baseUrl;
  final Dio _userDio;
  final Dio _publicDio;

  UserRemoteDataSourceImpl(
      {required SharedPreferences prefServices,
      @Named(baseURLStr) required this.baseUrl,
      @Named(authenticatedApiStr) required Dio userDio,
      @Named(publicApiStr) required Dio publicDio})
      : _prefServices = prefServices,
        _userDio = userDio,
        _publicDio = publicDio;

  @override
  Future<Either<Failure, UserModel>> login(
      String username, String password) async {
    final response = _publicDio.post('/login',
        data: {'username': username, 'password': password}).connectionGuard();

    return response.parseGuard<UserModel>((json) => UserModel.fromJson(json));
  }

  @override
  Future<Either<Failure, UserModel>> register(
      String username, String password) async {
    final response = _publicDio.post('/register',
        data: {'username': username, 'password': password}).connectionGuard();

    return response.parseGuard<UserModel>((json) => UserModel.fromJson(json));
  }

  @override
  Future<Either<Failure, UserModel>> getMe() async {
    final response = _userDio.get('/me').loginGuard().connectionGuard();

    return response.parseGuard<UserModel>((json) => UserModel.fromJson(json));
  }
}
