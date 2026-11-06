import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/auth/data/model/request/register_student_request_model.dart';
import 'package:edulearn_mobile/feature/auth/data/model/response/register_student_response_model.dart';

import '../model/forgot_password_model.dart';
import '../model/genareted_otp_model.dart';
import '../model/otp_model.dart';
import '../model/request/log_in_request_model.dart';
import '../model/response/log_in_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<Result<LogInResponseModel>> login({
    required LogInRequestModel request,
  });
  Future<Result<RegisterResponseModel>> signUpStudent({
    required RegisterRequestModel request,
  });
  Future<Result<RegisterResponseModel>> signUpTeacher({
    required RegisterRequestModel request,
  });
  Future<Result<OtpModel>> confrimEamil({
    required String email,
    required String otp,
  });
  Future<Result<GenaretedOtpModel>> resendOtp({required String email});
  Future<Result<ForgotPasswordModel>> forgotPassword({
    required String otp,
    required String email,
    required String password,
  });
}
