import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/article/article.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines.dart';
import 'package:sport_news/domain/news/top_sports_headlines/value_objects.dart';
import 'package:sport_news/infrastructure/news/article/article_data_transfer_object.dart';
import 'package:sport_news/infrastructure/news/article/article_converter.dart';

import '../../../main.dart';

part 'top_sports_headlines_data_transfer_object.freezed.dart';

part 'top_sports_headlines_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class TopSportsHeadlinesDto with _$TopSportsHeadlinesDto {
  factory TopSportsHeadlinesDto({
    String? status,
    int? totalResults,
    @ArticleConverter() List<Article?>? articles,
  }) = _TopSportsHeadlinesDto;

  factory TopSportsHeadlinesDto.fromDomain(
      TopSportsHeadlines? topSportsHeadlines) {
    return TopSportsHeadlinesDto(
      status: topSportsHeadlines!.status!.getOrCrash(),
      totalResults: topSportsHeadlines.totalResults!.getOrCrash(),
      articles: topSportsHeadlines.articles,
    );
  }

  factory TopSportsHeadlinesDto.fromJson(Map<String, dynamic> json) =>
      _$TopSportsHeadlinesDtoFromJson(json);
}

extension TopSportsHeadlinesDtoX on TopSportsHeadlinesDto {
  TopSportsHeadlines? toDomain() {
    List<Article?>? articleList = [];
    log.d(articleList);
    if (articles != null) {
      for (int x = 0; x < articles!.length; x++) {
        articleList.add(ArticleDto.fromDomain(articles![x]).toDomain());
      }
    }
    log.d(articleList);
    return TopSportsHeadlines(
      status: Status(status),
      totalResults: TotalResults(totalResults),
      articles: articleList,
    );
  }
}
