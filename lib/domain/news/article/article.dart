import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/article/value_objects.dart';
import 'package:sport_news/domain/news/source/source.dart';

part 'article.freezed.dart';

@freezed
class Article with _$Article {
  const factory Article({
    Source? source,
    Author? author,
    Title? title,
    Description? description,
    Url? url,
    UrlToImage? urlToImage,
    PublishedAt? publishedAt,
    Content? content,
  }) = _Article;

  factory Article.empty() => Article(
        source: Source.empty(),
        author: Author(''),
        title: Title(''),
        description: Description(''),
        url: Url(null),
        urlToImage: UrlToImage(null),
        publishedAt: PublishedAt(''),
        content: Content(''),
      );
}
