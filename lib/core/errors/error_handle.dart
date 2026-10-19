import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edulearn_mobile/core/errors/failure.dart';

Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const TimeoutFailure();

    case DioExceptionType.connectionError:
      return const NoInternetFailure();

    case DioExceptionType.badCertificate:
      return const UnknownFailure(
        message: 'A secure connection could not be established.',
      );

    case DioExceptionType.cancel:
      return const UnknownFailure(message: 'The request was cancelled.');

    case DioExceptionType.unknown:
      if (e.error is SocketException) return const NoInternetFailure();
      return const UnknownFailure();

    case DioExceptionType.badResponse:
      return _mapBadResponse(e.response);
  }
}

Failure _mapBadResponse(Response? response) {
  final statusCode = response?.statusCode;
  final message = _extractMessage(response?.data);

  switch (statusCode) {
    case 400:
      return ServerFailure(
        message: message ?? 'Invalid request.',
        statusCode: 400,
      );
    case 401:
      return UnauthorizedFailure(message: message ?? 'Please log in again.');
    case 403:
      return ServerFailure(
        message: message ?? 'Access denied.',
        statusCode: 403,
      );
    case 404:
      return ServerFailure(
        message: message ?? 'Resource not found.',
        statusCode: 404,
      );
    case 422:
      return ServerFailure(
        message: message ?? 'Validation failed.',
        statusCode: 422,
      );
    default:
      if (statusCode != null && statusCode >= 500) {
        return ServerFailure(
          message: message ?? 'Server error. Please try again later.',
          statusCode: statusCode,
        );
      }
      return ServerFailure(
        message: message ?? 'Something went wrong.',
        statusCode: statusCode,
      );
  }
}

/// Tries to pull a readable message out of the response body.
String? _extractMessage(dynamic data) {
  if (data is Map<String, dynamic>) {
    final msg = data['message']; //message from backend
    if (msg is String && msg.isNotEmpty) return msg;
  }
  if (data is String && data.isNotEmpty) return data;
  return null;
}
