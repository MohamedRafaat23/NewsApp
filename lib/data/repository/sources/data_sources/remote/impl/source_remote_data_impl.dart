import 'package:news_app/core/model/source_response/source_response.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_datasource.dart';

 class SourceRemoteDataImpl implements SourceRemoteDatasource{
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}