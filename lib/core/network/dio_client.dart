import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/app_config.dart';

class DioClient {
  DioClient({
    required AppConfig config,
    List<Interceptor> interceptors = const [],
  }) : dio = Dio(
         BaseOptions(
           baseUrl: config.baseUrl,
           connectTimeout: const Duration(seconds: 15),
           receiveTimeout: const Duration(seconds: 30),
           //!vip step for upload video
           sendTimeout: const Duration(seconds: 30),
           headers: const {'Accept': 'application/json'},
         ),
       ) {
    dio.interceptors.addAll(interceptors);

    if (config.enableLogs && kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: false,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      );
    }
  }

  final Dio dio;
}
