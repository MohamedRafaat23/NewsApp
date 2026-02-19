// interface for => Source Remote DataSource
import 'package:news_app/core/model/source_response/source_response.dart';
abstract class SourceRemoteDatasource{
    Future<SourceResponse> getSources(String categoryId);

}