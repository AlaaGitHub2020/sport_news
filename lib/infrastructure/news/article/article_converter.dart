import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_news/domain/news/article/article.dart';
import 'package:sport_news/infrastructure/news/article/article_data_transfer_object.dart';

class ArticleConverter implements JsonConverter<Article?, Map<String, dynamic>> {
  const ArticleConverter();

  @override
  Article? fromJson(Map<String, dynamic> json) {
    return ArticleDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Article? article) => ArticleDto().toJson();
}
