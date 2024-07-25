import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

const String networkUnknownFailureMessage = 'failure_network_unknown';

const String serverUnknownFailureMessage = 'failure_server_unknown';
const String connectionFailureMessage = 'failure_connection';
const String sendTimeoutFailureMessage = 'failure_send_timeout';
const String connectionTimeoutFailureMessage = 'failure_connection_timeout';
const String receiveTimeoutFailureMessage = 'failure_receive_timeout';


const String badRequestFailureMessage = 'failure_bad_request';
const String unauthorizedFailureMessage = 'failure_unauthorized';
const String forbiddenFailureMessage = 'failure_forbidden';
const String notFoundFailureMessage = 'failure_not_found';
const String methodNotAllowedFailureMessage = 'failure_method_not_allowed';
const String notAcceptableFailureMessage = 'failure_not_acceptable';
const String internalServerFailureMessage = 'failure_internal_server';
const String httpUnknownFailureMessage = 'failure_http_unknown';

const String parserFailureMessage = 'failure_parser';
const String notLoginFailureMessage = 'failure_not_login';

const int statusCodeBadRequest = 400;
const int statusCodeUnauthorized = 401;
const int statusCodeForbidden = 403;
const int statusCodeNotFound = 404;
const int statusCodeMethodNotAllowed = 405;
const int statusCodeNotAcceptable = 406;
const int statusCodeInternalServerError = 500;

const String cacheFailureMessage = 'failure_cache';

abstract class Failure extends Equatable {
  final String errorMessage;
  final dynamic cause;

  const Failure(this.errorMessage, this.cause);

  @override
  List<Object> get props => [errorMessage];

}
abstract class NetworkFailure extends Failure {
  bool shouldRetry() => false;
  const NetworkFailure(super.errorMessage, super.cause);
}

abstract class ServerFailure extends NetworkFailure {
  const ServerFailure(super.errorMessage, super.cause);
}

abstract class HttpFailure extends NetworkFailure {
  final int statusCode;

  const HttpFailure(super.errorMessage, super.cause, this.statusCode);
}


/// 1. NETWORK ERROR
class NetworkUnknownError extends NetworkFailure {
  const NetworkUnknownError(Object exception) : super(networkUnknownFailureMessage, exception);
}

/// SERVER ERROR
class ConnectionFailure extends ServerFailure {
  const ConnectionFailure() : super(connectionFailureMessage, null);
}

class ConnectTimeoutFailure extends ServerFailure {
  const ConnectTimeoutFailure(DioError dioError) : super(connectionTimeoutFailureMessage, dioError);
}
class SendTimeoutFailure extends ServerFailure {
  const SendTimeoutFailure(DioError dioError) : super(sendTimeoutFailureMessage, dioError);
}

class ReceiveTimeoutFailure extends ServerFailure {
  const ReceiveTimeoutFailure(DioError dioError) : super(receiveTimeoutFailureMessage, dioError);
}

class ServerUnknownFailure extends ServerFailure {
  const ServerUnknownFailure(DioError dioError) : super(serverUnknownFailureMessage, dioError);
}

/// END OF SERVER ERROR




/// HTTP ERROR
class BadRequestFailure extends HttpFailure {
  const BadRequestFailure(DioError dioError) : super(badRequestFailureMessage, dioError, statusCodeBadRequest);
}

class UnauthorizedFailure extends HttpFailure {
  const UnauthorizedFailure(DioError dioError) : super(unauthorizedFailureMessage, dioError, statusCodeUnauthorized);
}

class ForbiddenFailure extends HttpFailure {
  const ForbiddenFailure(DioError dioError) : super(forbiddenFailureMessage, dioError, statusCodeForbidden);
}

class NotFoundFailure extends HttpFailure {
  const NotFoundFailure(DioError dioError) : super(notFoundFailureMessage, dioError, statusCodeNotFound);
}

class MethodNotAllowedFailure extends HttpFailure {
  const MethodNotAllowedFailure(DioError dioError) : super(methodNotAllowedFailureMessage, dioError, statusCodeMethodNotAllowed);
}

class NotAcceptableFailure extends HttpFailure {
  const NotAcceptableFailure(DioError dioError) : super(notAcceptableFailureMessage, dioError, statusCodeNotAcceptable);
}

class InternalServerFailure extends HttpFailure {
  const InternalServerFailure(DioError dioError) : super(internalServerFailureMessage, dioError, statusCodeInternalServerError);
}

class HttpUnknownFailure extends HttpFailure {
  const HttpUnknownFailure(DioError dioError) : super(httpUnknownFailureMessage, dioError, -1);
}

/// END OF HTTP ERROR

class ParserError extends Failure {
  const ParserError(StackTrace stacktrace) : super(parserFailureMessage, stacktrace);
}

class NotLoginFailure extends Failure {
  const NotLoginFailure() : super(notLoginFailureMessage, null);
}

