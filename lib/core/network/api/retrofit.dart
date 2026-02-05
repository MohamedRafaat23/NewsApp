import 'package:dio/dio.dart';
import 'package:news_app/core/network/api/end_point.dart';
import 'package:retrofit/retrofit.dart';
import '../../model/source_response/source_response.dart';

part 'retrofit.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class RetrofitServices {
  factory RetrofitServices(Dio dio, {String? baseUrl}) = _RetrofitServices;

  @GET(EndPoint.sourceApi)
  Future<SourceResponse> getSources(
      @Query('apiKey') String apiKey,
      @Query('category') String categoryId,
      @Query('country') String country,
    );
  @GET(EndPoint.newsApi)
  Future<SourceResponse> getNewsBySourceId(
      @Query('apiKey') String apiKey,
      @Query('sources') String sourceId,

      );

}
