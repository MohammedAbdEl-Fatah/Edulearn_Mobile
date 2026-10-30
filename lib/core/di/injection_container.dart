import 'package:get_it/get_it.dart';

import '../../feature/auth/data/datasources/auth_remote_data_source.dart';
import '../../feature/auth/data/datasources/auth_remote_data_source_impl.dart';
import '../../feature/auth/data/repository/auth_repository_impl.dart';
import '../../feature/auth/domain/repository/auth_repository.dart';
import '../../feature/auth/domain/usecases/log_in_use_case.dart';
import '../../feature/auth/presentation/cubit/log_in/log_in_cubit.dart';
import '../config/app_config.dart';
import '../network/api_service.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;
Future<void> setupDependencies() async {
  // Core
  sl.registerLazySingleton<DioClient>(
    () => DioClient(config: AppConfig.current),
  );

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<DioClient>().dio));

  // Data
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: sl<ApiService>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()),
  );

  // Domain
  sl.registerLazySingleton(
    () => LogInUseCase(repository: sl<AuthRepository>()),
  );

  // Presentation
  sl.registerFactory(() => LogInCubit(sl<LogInUseCase>()));
}
