import 'dart:async';

import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/register_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/log_in_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/register_params.dart';

import '../entity/forgot_password_entity.dart';
import '../entity/genareted_otp_entity.dart';
import '../entity/logout_entity.dart';
import '../entity/otp_entity.dart';
import '../entity/refresh_token_entity.dart';
import '../params/forgot_password_params.dart';
import '../params/otp_params.dart';

abstract class AuthRepository {
  Future<Result<RegisterEntity>> registerStudent({
    required RegisterParams registerStudentParams,
  });
  Future<Result<RegisterEntity>> registerTeacher({
    required RegisterParams registerTeacherParams,
  });
  Future<Result<OtpEntity>> confirmEmail({required OtpParams otpParams});
  Future<Result<GenaretedOtpEntity>> resendOtp({required String email});

  Future<Result<AuthTokenEntity>> login({required LoginParams loginModel});
  Future<Result<ForgotPasswordEntity>> forgotPassword({
    required ForgotPasswordParams params,
  });

  Future<Result<LogoutEntity>> logout();
  Future<Result<RefreshTokenEntity>> refreshToken({required String role});
}
