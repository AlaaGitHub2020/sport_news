import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/source/source.dart';
import 'package:sport_news/domain/news/source/value_objects.dart';

part 'source_data_transfer_object.freezed.dart';

part 'source_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class SourceDto with _$SourceDto {
  factory SourceDto({
    String? id,
    String? name,
  }) = _SourceDto;

  factory SourceDto.fromDomain(Source? source) {
    return SourceDto(
      id: source!.id!.getOrCrash(),
      name: source.name!.getOrCrash(),
    );
  }

  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);
}

extension SourceDtoX on SourceDto {
  Source? toDomain() {
    return Source(
      id: Id(id),
      name: Name(name),
    );
  }
}
