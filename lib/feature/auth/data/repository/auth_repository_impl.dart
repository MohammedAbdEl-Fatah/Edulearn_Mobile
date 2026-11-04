import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:edulearn_mobile/feature/auth/data/model/request/register_student_request_model.dart';

import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/otp_entity.dart';

import 'package:edulearn_mobile/feature/auth/domain/params/log_in_params.dart';

import '../../domain/entity/forgot_password_entity.dart';
import '../../domain/entity/genareted_otp_entity.dart';
import '../../domain/entity/register_entity.dart';
import '../../domain/params/forgot_password_params.dart';
import '../../domain/params/otp_params.dart';
import '../../domain/params/register_params.dart';
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
  Future<Result<OtpEntity>> confirmEmail({required OtpParams otpParams}) {
    return _authRemoteDataSource.confrimEamil(
      email: otpParams.email,
      otp: otpParams.otp,
    );
  }

  @override
  Future<Result<ForgotPasswordEntity>> forgotPassword({
    required ForgotPasswordParams params,
  }) async {
    final result = await _authRemoteDataSource.forgotPassword(
      otp: params.otp,
      email: params.email,
      password: params.password,
    );
    return result.fold(
      (failure) => Failed<ForgotPasswordEntity>(failure),
      (success) => Success<ForgotPasswordEntity>(
        ForgotPasswordEntity(message: success.message),
      ),
    );
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
  Future<Result<RegisterEntity>> registerStudent({
    required RegisterParams registerStudentParams,
  }) async {
    final RegisterRequestModel req = RegisterRequestModel(
      firstName: registerStudentParams.firstName,
      lastName: registerStudentParams.lastName,
      email: registerStudentParams.email,
      password: registerStudentParams.password,
      confirmPassword: registerStudentParams.confirmPassword,
      dob: registerStudentParams.dob.toString(),
      phone: registerStudentParams.phone,
    );
    final result = await _authRemoteDataSource.signUpStudent(request: req);
    return result.fold(
      (failure) => Failed<RegisterEntity>(failure),
      (success) => Success<RegisterEntity>(success.registerModel),
    );
  }

  @override
  Future<Result<RegisterEntity>> registerTeacher({
    required RegisterParams registerTeacherParams,
  }) async {
    final RegisterRequestModel req = RegisterRequestModel(
      firstName: registerTeacherParams.firstName,
      lastName: registerTeacherParams.lastName,
      email: registerTeacherParams.email,
      password: registerTeacherParams.password,
      confirmPassword: registerTeacherParams.confirmPassword,
      dob: registerTeacherParams.dob.toString(),
      phone: registerTeacherParams.phone,
    );
    final result = await _authRemoteDataSource.signUpTeacher(request: req);
    return result.fold(
      (failure) => Failed<RegisterEntity>(failure),
      (success) => Success<RegisterEntity>(success.registerModel),
    );
  }

  @override
  Future<Result<GenaretedOtpEntity>> resendOtp({required String email}) {
    return _authRemoteDataSource.resendOtp(email: email);
  }
}
