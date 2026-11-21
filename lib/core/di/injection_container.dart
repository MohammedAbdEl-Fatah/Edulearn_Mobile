import 'package:get_it/get_it.dart';

import '../../feature/auth/auth_injection.dart';
import '../../feature/profile/profile_injection.dart';
import '../../feature/user/user_injection.dart';
import '../config/app_config.dart';
import '../network/api_service.dart';
import '../network/auth_interceptor.dart';
import '../network/auth_session_manager.dart';
import '../network/dio_client.dart';
import '../storage/secure_storage.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await setupCoreDependencies();

  setupAuthDependencies();
  setupUserDependencies();
  setupProfileDependencies();
}

//common injection for all features
Future<void> setupCoreDependencies() async {
  sl.registerLazySingleton<SecureStorage>(() => SecureStorage());
  sl.registerLazySingleton<DioClient>(() {
    final client = DioClient(config: AppConfig.current);

    // NEW: add the interceptor after Dio is created
    client.dio.interceptors.insert(
      0, // first, so it runs before the logger
      AuthInterceptor(
        dio: client.dio,
        tokenStorage: sl<SecureStorage>(),
        sessionManager: sl<AuthSessionManager>(),
      ),
    );

    return client;
  });

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<DioClient>().dio));
}
