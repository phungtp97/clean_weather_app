import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/extension/extension.dart';
import '../../core/core.dart';

extension ResponseExt on Response<dynamic> {}

extension ResponseFutureExt<T> on Future<Response<T>> {
  Future<Response<T>> connectionGuard() async {
    var isConnected = await GetIt.I.get<NetworkInfo>().isConnected;
    if (isConnected) {
      return this;
    } else {
      throw const ConnectionFailure();
    }
  }

  Future<Response<T>> loginGuard() async {
    var hasToken = GetIt.I.get<SharedPreferences>().token != null;

    if (hasToken) {
      return this;
    } else {
      throw const NotLoginFailure();
    }
  }

  Future<Either<Failure, T>> parseGuard<T>(
      T Function(dynamic json) jsonParser) async {
    try {
      final response = await this;
      final result = jsonParser(response.data);
      return Right(result);
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.response) {
        switch (dioError.response?.statusCode) {
          case 400:
            return Left(BadRequestFailure(dioError));
          case 401:
            return Left(UnauthorizedFailure(dioError));
          case 404:
            return Left(NotFoundFailure(dioError));
          case 500:
            return Left(InternalServerFailure(dioError));
          case 403:
            return Left(ForbiddenFailure(dioError));
          case 405:
            return Left(MethodNotAllowedFailure(dioError));
          case 406:
            return Left(NotAcceptableFailure(dioError));
          default:
            return Left(HttpUnknownFailure(dioError));
        }
      } else if (dioError.type == DioErrorType.connectTimeout) {
        return Left(ConnectTimeoutFailure(dioError));
      } else if (dioError.type == DioErrorType.sendTimeout) {
        return Left(SendTimeoutFailure(dioError));
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        return Left(ReceiveTimeoutFailure(dioError));
      } else {
        return Left(ServerUnknownFailure(dioError));
      }
    } catch (e) {
      return Left(NetworkUnknownError(e));
    }
  }
}
