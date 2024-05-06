import 'package:equatable/equatable.dart';
import 'package:nothing_dialer/core/errors/base_exception.dart';
import 'package:nothing_dialer/core/errors/failure.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class BaseException extends Failure implements Exception {
  BaseException(super.message, {required this.baseException});
  final BaseErrorEntity baseException;
}

class NetworkException extends BaseException {
  NetworkException(super.message)
      : super(
          baseException: BaseErrorEntity(
            message: 'No Internet Connection',
            success: false,
          ),
        );
}

class CacheException implements Exception {
  CacheException({required this.message});
  final String message;
}

class UnknownException implements Exception {
  UnknownException({required this.message});
  final String message;
}

class InvalidInputException implements Exception {
  InvalidInputException({required this.message});
  final String message;
}

class NoInternetException implements Exception {
  NoInternetException({required this.message});
  final String message;
}

class UnAuthorizedException implements Exception {
  UnAuthorizedException({required this.message});
  final String message;
}

class NotFoundException implements Exception {
  NotFoundException({required this.message});
  final String message;
}

class BadRequestException implements Exception {
  BadRequestException({required this.message});
  final String message;
}

class InternalServerException implements Exception {
  InternalServerException({required this.message});
  final String message;
}

class ConflictException implements Exception {
  ConflictException({required this.message});
  final String message;
}

class UnProcessableEntityException implements Exception {
  UnProcessableEntityException({required this.message});
  final String message;
}

class ForbiddenException implements Exception {
  ForbiddenException({required this.message});
  final String message;
}

class TooManyRequestsException implements Exception {
  TooManyRequestsException({required this.message});
  final String message;
}

class SignInException implements Exception {
  SignInException({required this.signInError});
  final BaseErrorEntity signInError;
}
