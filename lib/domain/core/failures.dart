import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines_value_failure.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure<T> with _$Failure<T> {
  const factory Failure.topSportsHeadlines(
      TopSportsHeadlinesValueFailure<T> failure) = _TopSportsHeadlines<T>;
}
