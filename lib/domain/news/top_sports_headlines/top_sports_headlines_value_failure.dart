import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_sports_headlines_value_failure.freezed.dart';

@freezed
abstract class TopSportsHeadlinesValueFailure<T> with _$TopSportsHeadlinesValueFailure<T> {
  const factory TopSportsHeadlinesValueFailure.statusIsNotValued({
    required T failedValue,
  }) = StatusIsNotOk<T>;

  const factory TopSportsHeadlinesValueFailure.totalResultsIsNotValued({
    required T failedValue,
  }) = TotalResultsIsNotValued<T>;

  const factory TopSportsHeadlinesValueFailure.noArticles({
    required T failedValue,
  }) = NoArticles<T>;
}
