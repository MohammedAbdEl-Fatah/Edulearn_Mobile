import 'dart:async';

import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/register_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/log_in_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/register_params.dart';

abstract class AuthRepository {
  Future<Result<RegisterEntity>> registerStudent({
    required RegisterParams registerStudentParams,
  });
  Future<Result<RegisterEntity>> registerTeacher({
    required RegisterParams registerTeacherParams,
  });
  Future<void> confirmEmail({required String email, required String otp});
  Future<void> resendOtp({required String email});

  Future<Result<AuthTokenEntity>> login({required LoginParams loginModel});
  Future<void> forgotPassword({required String email});

  Future<void> logout();
  Future<void> refreshToken();
}
