import 'package:dio/dio.dart';
import 'package:health_care/core/networking/api_error_model.dart';

abstract class RequestFailure {
  final ApiErrorModel apiErrorModel;

  const RequestFailure(this.apiErrorModel);
}

class ServerFailure extends RequestFailure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch(dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(ApiErrorModel(message: "Connection Timeout With Api Server"));
      case DioExceptionType.sendTimeout:
        return ServerFailure(ApiErrorModel(message: "Send Timeout With Api Server"));
      case DioExceptionType.receiveTimeout:
        return ServerFailure(ApiErrorModel(message: "Receive Timeout With Api Server"));
      case DioExceptionType.badCertificate:
        return ServerFailure(ApiErrorModel(message: "Connection Timeout With Api Server"));
      case DioExceptionType.badResponse:
        return ServerFailure(ApiErrorModel.fromJson(dioException.response!.data));
      case DioExceptionType.cancel:
        return ServerFailure(ApiErrorModel(message: "Request was canceled"));
      case DioExceptionType.connectionError:
        return ServerFailure(ApiErrorModel(message: "Connection error, Please check your internet connection"));
      case DioExceptionType.unknown:
        return ServerFailure(ApiErrorModel(message: 'Opps there was an error, Please try later!'));
    }
  }
}