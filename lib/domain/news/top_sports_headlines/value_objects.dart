import 'package:dartz/dartz.dart';
import 'package:sport_news/domain/core/failures.dart';
import 'package:sport_news/domain/core/value_objects.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines_value_validators.dart';

class Status extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Status(String? input) {
    return Status._(
      validateStatus(input),
    );
  }

  const Status._(this.value);
}

class TotalResults extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory TotalResults(int? input) {
    return TotalResults._(
      validateTotalResults(input),
    );
  }

  const TotalResults._(this.value);
}
