import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/article/article.dart';
import 'package:sport_news/domain/news/top_sports_headlines/value_objects.dart';

part 'top_sports_headlines.freezed.dart';

@freezed
class TopSportsHeadlines with _$TopSportsHeadlines {
  const factory TopSportsHeadlines({
    Status? status,
    TotalResults? totalResults,
    List<Article?>? articles,
  }) = _TopSportsHeadlines;

  factory TopSportsHeadlines.empty() => TopSportsHeadlines(
        status: Status(''),
        totalResults: TotalResults(0),
        articles: [],
      );
}
