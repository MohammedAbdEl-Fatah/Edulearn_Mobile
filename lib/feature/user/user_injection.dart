import '../../core/di/injection_container.dart';
import '../../core/network/api_service.dart';
import 'data/datasource/user_remote_data_source.dart';
import 'data/datasource/user_remote_data_source_impl.dart';
import 'data/repository/user_repository_impl.dart';
import 'domain/repository/user_repository.dart';
import 'domain/usecase/user_use_case.dart';
import 'presentation/cubit/user_cubit.dart';

void setupUserDependencies() {
  // Data
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(apiService: sl<ApiService>()),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl<UserRemoteDataSource>()),
  );

  // Use case
  sl.registerLazySingleton(
    () => UserUseCase(repository: sl<UserRepository>()),
  );

  // Cubit
  sl.registerFactory(() => UserCubit(InitUserState(), sl<UserUseCase>()));
}
