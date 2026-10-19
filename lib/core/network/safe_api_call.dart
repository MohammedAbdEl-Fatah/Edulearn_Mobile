import 'package:dio/dio.dart';
import 'package:edulearn_mobile/core/errors/error_handle.dart';
import 'package:edulearn_mobile/core/errors/failure.dart';
import 'package:edulearn_mobile/core/errors/result.dart';

Future<Result<T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    return Success(await call());
  } on DioException catch (e) {
    return Failed(mapDioException(e));
  } catch (_) {
    return Failed(UnknownFailure());
  }
}
