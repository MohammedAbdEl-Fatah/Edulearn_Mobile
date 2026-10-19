import 'package:dio/dio.dart';
import 'package:edulearn_mobile/core/errors/result.dart';

import 'safe_api_call.dart';

class ApiService {
  ApiService(this._dio);

  final Dio _dio;

  Future<Result<T>> _request<T>(
    String method,
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    void Function(int sent, int total)? onSendProgress,
    T Function(dynamic json)? parser,
  }) => safeApiCall<T>(() async {
    final res = await _dio.request<dynamic>(
      path,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      options: (options ?? Options()).copyWith(method: method),
    );
    return parser != null ? parser(res.data) : res.data as T;
  });
  //read
  //method get
  Future<Result<T>> get<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    T Function(dynamic json)? parser,
  }) => _request<T>(
    "GET",
    path,
    data: data,
    query: query,
    cancelToken: cancelToken,
    parser: parser,
  );
  //write
  //method post
  Future<Result<T>> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    T Function(dynamic json)? parser,
  }) => _request(
    "POST",
    path,
    data: data,
    cancelToken: cancelToken,
    query: query,
    parser: parser,
  );

  //update
  //mathod put
  Future<Result<T>> put<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    T Function(dynamic json)? parser,
  }) => _request(
    "PUT",
    path,
    data: data,
    cancelToken: cancelToken,
    query: query,
    parser: parser,
  );
  //method patch
  Future<Result<T>> patch<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    T Function(dynamic json)? parser,
  }) => _request(
    "PATCH",
    path,
    data: data,
    cancelToken: cancelToken,
    query: query,
    parser: parser,
  );

  //delete
  //method delete
  Future<Result<T>> delete<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    T Function(dynamic json)? parser,
  }) => _request<T>(
    'DELETE',
    path,
    data: data,
    query: query,
    cancelToken: cancelToken,
    parser: parser,
  );

  ///upload file or video
  Future<Result<T>> upload<T>({
    required String path,
    required FormData formData,
    String method = 'POST',
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
    T Function(dynamic json)? parser,
  }) => _request<T>(
    method,
    path,
    data: formData,
    cancelToken: cancelToken,
    parser: parser,
    options: Options(sendTimeout: Duration.zero),
    onSendProgress: onProgress == null
        ? null
        : (sent, total) {
            if (total > 0) onProgress(sent / total);
          },
  );
}
