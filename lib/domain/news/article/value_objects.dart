import 'package:dartz/dartz.dart';
import 'package:sport_news/domain/news/article/article_value_validators.dart';
import 'package:sport_news/domain/core/failures.dart';
import 'package:sport_news/domain/core/value_objects.dart';

class Author extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Author(String? input) {
    return Author._(
      validateAuthor(input),
    );
  }

  const Author._(this.value);
}

class Title extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Title(String? input) {
    return Title._(
      validateTitle(input),
    );
  }

  const Title._(this.value);
}

class Description extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Description(String? input) {
    return Description._(
      validateDescription(input),
    );
  }

  const Description._(this.value);
}

class Url extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Url(String? input) {
    return Url._(
      validateUrl(input),
    );
  }

  const Url._(this.value);
}

class UrlToImage extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory UrlToImage(String? input) {
    return UrlToImage._(
      validateUrlToImage(input),
    );
  }

  const UrlToImage._(this.value);
}

class PublishedAt extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory PublishedAt(String? input) {
    return PublishedAt._(
      validatePublishedAt(input),
    );
  }

  const PublishedAt._(this.value);
}

class Content extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Content(String? input) {
    return Content._(
      validateContent(input),
    );
  }

  const Content._(this.value);
}
