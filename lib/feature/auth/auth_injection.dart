import 'package:edulearn_mobile/feature/auth/domain/usecases/confirm_email_use_case.dart';
import 'package:edulearn_mobile/feature/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:edulearn_mobile/feature/auth/domain/usecases/register_student_use_case.dart';
import 'package:edulearn_mobile/feature/auth/presentation/cubit/reset_password/reset_password_cubit.dart';
import 'package:edulearn_mobile/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';

import '../../core/di/injection_container.dart';
import '../../core/network/api_service.dart';
import '../../core/network/auth_session_manager.dart';
import '../../core/storage/secure_storage.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/datasources/auth_remote_data_source_impl.dart';
import 'data/repository/auth_repository_impl.dart';
import 'domain/repository/auth_repository.dart';
import 'domain/usecases/log_in_use_case.dart';
import 'domain/usecases/logout_use_case.dart';
import 'domain/usecases/refreh_token_use_case.dart';
import 'domain/usecases/register_teacher_use_case.dart';
import 'domain/usecases/resend_otp_use_case.dart';
import 'presentation/cubit/auth/auth_cubit.dart';
import 'presentation/cubit/confirm_email/confirm_email_cubit.dart';
import 'presentation/cubit/log_in/log_in_cubit.dart';
import 'presentation/cubit/logout/logout_cubit.dart';
import 'presentation/cubit/register_student/register_student_cubit.dart';
import 'presentation/cubit/register_teacher/register_teacher_cubit.dart';

void setupAuthDependencies() {
  // Data
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: sl<ApiService>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()),
  );
  sl.registerLazySingleton<AuthSessionManager>(
    () => AuthSessionManager(
      storage: sl<SecureStorage>(),
      // This is a function. It runs ONLY when a token expires,
      // so GetIt does not need the use case at startup. This breaks the circle.
      refreshCall: () => sl<RefrehTokenUseCase>().call(),
      // Also runs only later: tell AuthCubit the user is logged out
      onSessionExpired: () => sl<AuthCubit>().sessionExpired(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(
    () => LogInUseCase(repository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton(
    () => RegisterStudentUseCase(repository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton(
    () => RegisterTeacherUseCase(repository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton(
    () => ConfirmEmailUseCase(repository: sl<AuthRepository>()),
  );
  sl.registerLazySingleton(
    () => ResendOtpUseCase(repository: sl<AuthRepository>()),
  );
  sl.registerLazySingleton(
    () => ForgotPasswordUseCase(repository: sl<AuthRepository>()),
  );
  //does't use
  sl.registerLazySingleton(() => RefrehTokenUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(
    () => LogoutUseCase(repository: sl<AuthRepository>()),
  );
  // Cubits
  sl.registerFactory(() => LogInCubit(sl<LogInUseCase>()));
  sl.registerFactory(() => LogoutCubit(sl<LogoutUseCase>()));
  sl.registerFactory(() => RegisterStudentCubit(sl<RegisterStudentUseCase>()));
  sl.registerFactory(() => RegisterTeacherCubit(sl<RegisterTeacherUseCase>()));
  sl.registerFactory(() => ConfirmEmailCubit(sl<ConfirmEmailUseCase>()));
  sl.registerFactory(() => ResendOtpCubit(sl<ResendOtpUseCase>()));
  sl.registerFactory(() => ResetPasswordCubit(sl<ForgotPasswordUseCase>()));
  //mesage and storge
  sl.registerLazySingleton(
    () => AuthCubit(sl<AuthSessionManager>(), sl<SecureStorage>()),
  );
}
