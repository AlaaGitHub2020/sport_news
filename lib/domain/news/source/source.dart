import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/source/value_objects.dart';

part 'source.freezed.dart';

@freezed
class Source with _$Source {
  const factory Source({
    Id? id,
    Name? name,
  }) = _Source;

  factory Source.empty() => Source(
        id: Id(null),
        name: Name(''),
      );
}
