import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xtpay/app/widgets/app_colors.dart';
import 'package:xtpay/app/widgets/toast_bar.dart';

class DioExceptions {
  static String fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "Request to API server was cancelled";
      case DioExceptionType.connectionError:
        toastBar(context: Get.context!, label: "No Internet! Please Check your internet connection.", bgcolor: AppColors.red);
        return "No Internet! Please Check your internet connection.";
      case DioExceptionType.connectionTimeout:
        toastBar(context: Get.context!, label: "Connecting to server failed!\nPlease Check your internet connection.", bgcolor: AppColors.red);
        return "Connection timeout with API server";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout in connection with API server";
      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response?.statusCode);
      case DioExceptionType.sendTimeout:
        return "Send timeout in connection with API server";
      case DioExceptionType.unknown:
        return "Something went wrong";
      default:
        return "Unexpected error occurred";
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not found";
      case 500:
        return "Internal server error";
      default:
        return "Received invalid status code: $statusCode";
    }
  }
}
