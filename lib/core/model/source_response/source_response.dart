import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/core/model/source_response/source.dart';


part 'source_response.g.dart';
@JsonSerializable()
class SourceResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "sources")
  final List<Source>? sources;
  @JsonKey(name: "message")
  final String? message;

  SourceResponse ({
    this.message,
    this.status,
    this.sources,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return _$SourceResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourceResponseToJson(this);
  }
}



