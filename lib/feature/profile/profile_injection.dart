import 'package:edulearn_mobile/core/network/api_service.dart';
import 'package:edulearn_mobile/feature/profile/data/datasource/remote_data_source_porfile.dart';
import 'package:edulearn_mobile/feature/profile/data/datasource/remote_data_source_porfile_impl.dart';
import 'package:edulearn_mobile/feature/profile/data/repository/profile_repository_impl.dart';
import 'package:edulearn_mobile/feature/profile/domain/repository/repository_profile.dart';
import 'package:edulearn_mobile/feature/profile/domain/usecase/edit_profile_use_case.dart';
import 'package:edulearn_mobile/feature/profile/presentation/cubit/edit_profile_cubit.dart';

import '../../core/di/injection_container.dart';

void setupProfileDependencies() {
  //Data
  //remote
  sl.registerLazySingleton<RemoteDataSourcePorfile>(
    () => RemoteDataSourcePorfileImpl(apiService: sl<ApiService>()),
  );
  //repository data and domain
  sl.registerLazySingleton<RepositoryProfile>(
    () => ProfileRepositoryImpl(
      remoteDataSourcePorfile: sl<RemoteDataSourcePorfile>(),
    ),
  );
  //use cases

  sl.registerLazySingleton<EditProfileUseCase>(
    () => EditProfileUseCase(repositoryProfile: sl<RepositoryProfile>()),
  );

  //cubit
  sl.registerFactory(
    () => EditProfileCubit(editProfileUseCase: sl<EditProfileUseCase>()),
  );
}
