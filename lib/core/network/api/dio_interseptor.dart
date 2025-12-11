
import 'package:dio/dio.dart';
import 'package:news_app/core/network/api/api_constant.dart';
import 'package:news_app/core/network/api/app_exception.dart';

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
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle errors here
    String message = "Something Went Wrong , please try again";
  try{
    //server error =>message found in api responce in statues message
      if (
        err.response !=null &&
        err.response!.data is Map &&
        err.response!.data.containsKey('message')) {
      message = err.response!.data['message'];
    } else {
      //user error or other bad responce types of error
      switch (err.type) {
        //internet Error
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          message =
              'connection timed out , please check your internet connection';
          break;
        case DioExceptionType.badResponse:
          message = 'Failed to load data : ${err.response?.statusCode}';
          break;
        case DioExceptionType.cancel:
          message = 'Request was canceld';
          break;
        case DioExceptionType.unknown:
          message = 'Unknown networl error occurred';
          break;
        case DioExceptionType.badCertificate:
          throw UnimplementedError();
      }
    }
  }catch(e){
    message = 'unexpected error occure ${e.toString()}';
  }
   handler.next(
    DioException(
    requestOptions:err.requestOptions,
    error: AppException(message: message),
    message: message,
    response: err.response,
    
    
    )
   );
  }
}
