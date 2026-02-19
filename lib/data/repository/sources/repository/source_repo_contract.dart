// interface for => Source Repository
import 'package:news_app/core/model/source_response/source_response.dart';

abstract class SourceRepository{
  Future<SourceResponse> getSources(String categoryId);
} 