import 'package:dartz/dartz.dart';
import 'package:sport_news/domain/core/failures.dart';
import 'package:sport_news/domain/core/value_objects.dart';
import 'package:sport_news/domain/news/source/source_value_validators.dart';

class Id extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Id(String? input) {
    return Id._(
      validateId(input),
    );
  }

  const Id._(this.value);
}

class Name extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Name(String? input) {
    return Name._(
      validateName(input),
    );
  }

  const Name._(this.value);
}
