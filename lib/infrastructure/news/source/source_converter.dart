import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/source/source.dart';
import 'package:sport_news/infrastructure/news/source/source_data_transfer_object.dart';

class SourceConverter implements JsonConverter<Source?, Map<String, dynamic>> {
  const SourceConverter();

  @override
  Source? fromJson(Map<String, dynamic> json) {
    return SourceDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Source? source) => SourceDto().toJson();
}
