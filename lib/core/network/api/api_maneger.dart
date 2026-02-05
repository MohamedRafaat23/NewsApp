import 'package:dio/dio.dart';
import 'package:news_app/core/network/api/api_constant.dart';
import 'package:news_app/core/network/api/dio_interseptor.dart';
import 'package:news_app/core/network/api/end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../model/news_responce/news_response.dart';
import '../../model/source_response/source_response.dart';

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

  static Future<SourceResponse> getSources({required String categoryId}) async {
      final responce = await dio.get<dynamic>(
        EndPoint.sourceApi,
        queryParameters: {
          'country': 'us',
          'category': categoryId,
        },
      );
      return SourceResponse.fromJson(responce.data);
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
  try {
    final response = await dio.get(
      EndPoint.newsApi,
      queryParameters: {
        'sources': sourceId,
      },
    );
    return NewsResponse.fromJson(response.data);
  } on DioException catch (e) {
    throw Exception(e.response?.data['message'] ?? 'Network error');
  }
  }
  }