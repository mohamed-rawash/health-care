import 'package:dio/dio.dart';
import 'package:health_care/core/networking/api_error_handler.dart';
import 'package:health_care/core/networking/api_service.dart';
import 'package:health_care/features/login/data/models/login_request_body.dart';
import 'package:health_care/features/login/data/models/login_response.dart';

import '../../../../core/networking/api_result.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ServerFailure.fromDioError(error));
    }
  }
}
