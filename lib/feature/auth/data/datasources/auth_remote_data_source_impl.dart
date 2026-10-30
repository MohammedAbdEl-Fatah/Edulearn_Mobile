import "package:edulearn_mobile/core/errors/result.dart";
import "package:edulearn_mobile/core/network/api_service.dart";
import "package:edulearn_mobile/core/network/end_piont_api.dart";
import "package:edulearn_mobile/feature/auth/data/model/request/register_student_request_model.dart";
import "package:edulearn_mobile/feature/auth/data/model/response/register_student_response_model.dart";
import "auth_remote_data_source.dart";
import "../model/request/log_in_request_model.dart";
import "../model/response/log_in_response_model.dart";

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // now can using api Service form networn in folder core
  final ApiService _apiService;

  AuthRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<Result<LogInResponseModel>> login({
    required LogInRequestModel request,
  }) async {
    return _apiService.post<LogInResponseModel>(
      path: AuthEndPiontApi.login,
      data: request.toJson(),
      parser: (json) =>
          LogInResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<Result<RegisterResponseModel>> signUpStudent({
    required RegisterRequestModel request,
  }) async {
    return _apiService.post<RegisterResponseModel>(
      path: AuthEndPiontApi.signUpStudent,
      data: request.toJson(),
      parser: (json) =>
          RegisterResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<Result<RegisterResponseModel>> signUpTeacher({
    required RegisterRequestModel request,
  }) {
    return _apiService.post<RegisterResponseModel>(
      path: AuthEndPiontApi.signUpTeacher,
      data: request.toJson(),
      parser: (json) =>
          RegisterResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
