import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/register_student_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/log_in_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/register_student.dart';

abstract class AuthRepository {
  Future<Result<RegisterStudentEntity>> registerStudent({
    required RegisterStudentParams registerStudentParams,
  });
  Future<void> registerTeacher(Map<String, dynamic> model);
  Future<void> confirmEmail({required String email, required String otp});
  Future<void> resendOtp({required String email});

  Future<Result<AuthTokenEntity>> login({required LoginParams loginModel});
  Future<void> forgotPassword({required String email});

  Future<void> logout();
  Future<void> refreshToken();
}
