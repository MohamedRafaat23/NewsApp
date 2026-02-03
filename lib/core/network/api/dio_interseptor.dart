import 'package:dio/dio.dart';
import 'package:news_app/core/network/api/api_constant.dart';

class DioInterseptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add headers or authorization tokens here
    options.headers.addAll({'X-Api-Key': ApiConstants.apiKey});
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle response here
    super.onResponse(response, handler);
  }

  @override
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = "Something went wrong, please try again";

    try {
      if (err.response != null &&
          err.response!.data is Map &&
          err.response!.data.containsKey('message')) {
        message = err.response!.data['message'];
      } else {
        switch (err.type) {
          case DioExceptionType.connectionError:
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            message = 'Please check your internet connection';
            break;
          case DioExceptionType.badResponse:
            message = 'Server error: ${err.response?.statusCode ?? ''}';
            break;
          case DioExceptionType.cancel:
            message = 'Request was cancelled';
            break;
          case DioExceptionType.unknown:
            message = 'Unexpected network error';
            break;
          case DioExceptionType.badCertificate:
            message = 'Bad certificate error';
            break;
        }
      }
    } catch (_) {
      message = 'Unexpected error occurred';
    }

    /// ✅ بدل ما نرمي Error → نرجّع Response
    handler.resolve(
      Response(
        requestOptions: err.requestOptions,
        data: {'status': 'error', 'message': message},
        statusCode: err.response?.statusCode ?? 500,
      ),
    );
  }
}
