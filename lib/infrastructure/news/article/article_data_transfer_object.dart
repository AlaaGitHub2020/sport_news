import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/article/article.dart';
import 'package:sport_news/domain/news/article/value_objects.dart';
import 'package:sport_news/domain/news/source/source.dart';
import 'package:sport_news/infrastructure/news/source/source_converter.dart';
import 'package:sport_news/infrastructure/news/source/source_data_transfer_object.dart';

part 'article_data_transfer_object.freezed.dart';

part 'article_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class ArticleDto with _$ArticleDto {
  factory ArticleDto({
    @SourceConverter() Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _ArticleDto;

  factory ArticleDto.fromDomain(Article? article) {
    return ArticleDto(
      source: article!.source,
      author: article.author!.getOrCrash(),
      title: article.title!.getOrCrash(),
      description: article.description!.getOrCrash(),
      url: article.url!.getOrCrash(),
      urlToImage: article.urlToImage!.getOrCrash(),
      publishedAt: article.publishedAt!.getOrCrash(),
      content: article.content!.getOrCrash(),
    );
  }

  factory ArticleDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleDtoFromJson(json);
}

extension ArticleDtoX on ArticleDto {
  Article? toDomain() {
    return Article(
      source: SourceDto.fromDomain(source).toDomain(),
      author: Author(author),
      title: Title(title),
      description: Description(description),
      url: Url(url),
      urlToImage: UrlToImage(urlToImage),
      publishedAt: PublishedAt(publishedAt),
      content: Content(content),
    );
  }
}
