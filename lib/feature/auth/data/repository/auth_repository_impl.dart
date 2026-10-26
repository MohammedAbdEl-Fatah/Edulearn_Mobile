import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/auth/data/datasources/auth_remote_data_source.dart';

import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';

import 'package:edulearn_mobile/feature/auth/domain/params/log_in_params.dart';

import '../../domain/repository/auth_repository.dart';
import '../model/request/log_in_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Result<AuthTokenEntity>> login({
    required LoginParams loginModel,
  }) async {
    final req = LogInRequestModel(
      email: loginModel.email,
      password: loginModel.password,
    );
    final result = await _authRemoteDataSource.login(request: req);
    return result.fold(
      (failure) => Failed<AuthTokenEntity>(failure),
      (success) => Success<AuthTokenEntity>(success.token),
    );
  }

  @override
  Future<void> confirmEmail({required String email, required String otp}) {
    // TODO: implement confirmEmail
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword({required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<void> registerStudent({
    required String email,
    required String password,
  }) {
    // TODO: implement registerStudent
    throw UnimplementedError();
  }

  @override
  Future<void> registerTeacher(Map<String, dynamic> model) {
    // TODO: implement registerTeacher
    throw UnimplementedError();
  }

  @override
  Future<void> resendOtp({required String email}) {
    // TODO: implement resendOtp
    throw UnimplementedError();
  }
}
