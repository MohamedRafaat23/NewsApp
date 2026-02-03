import 'package:dio/dio.dart';
import 'package:news_app/core/model/news_responce.dart';
import 'package:news_app/core/model/source_responce.dart';
import 'package:news_app/core/network/api/api_constant.dart';
import 'package:news_app/core/network/api/dio_interseptor.dart';
import 'package:news_app/core/network/api/end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManeger {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {"Accept": "application/json"},
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  )
    ..interceptors.add(DioInterseptor())
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

  static Future<SourceResponce> getSources({required String categoryId}) async {
    try {
      final responce = await dio.get<dynamic>(
        EndPoint.sourceApi,
        queryParameters: {
          // 'apiKey': ApiConstants.apiKey,
          'country': 'us',
          'category': categoryId,
        },
      );
      return SourceResponce.fromJson(responce.data);
    }  catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponce> getNewsBySourceId(String sourceId) async {
  try {
    final response = await dio.get(
      EndPoint.newsApi,
      queryParameters: {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
      },
    );
    return NewsResponce.fromJson(response.data);
  } on DioException catch (e) {
    throw Exception(e.response?.data['message'] ?? 'Network error');
  }
  }
  }