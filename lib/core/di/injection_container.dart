import 'package:get_it/get_it.dart';

import '../../feature/auth/auth_injection.dart';
import '../config/app_config.dart';
import '../network/api_service.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await setupCoreDependencies();

  setupAuthDependencies();
}

//common injection for all features
Future<void> setupCoreDependencies() async {
  sl.registerLazySingleton<DioClient>(
    () => DioClient(config: AppConfig.current),
  );

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<DioClient>().dio));
}
