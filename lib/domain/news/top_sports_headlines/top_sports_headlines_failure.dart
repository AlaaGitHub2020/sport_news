import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_sports_headlines_failure.freezed.dart';

@freezed
 class TopSportsHeadlinesFailure with _$TopSportsHeadlinesFailure {
  const factory TopSportsHeadlinesFailure.unexpected() = _Unexpected;

  const factory TopSportsHeadlinesFailure.fetchNewsDataFailure() = _FetchNewsDataFailure;
}
