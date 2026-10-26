import 'package:edulearn_mobile/core/errors/result.dart';

import '../model/request/log_in_request_model.dart';
import '../model/response/log_in_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<Result<LogInResponseModel>> login({required LogInRequestModel request});
}
