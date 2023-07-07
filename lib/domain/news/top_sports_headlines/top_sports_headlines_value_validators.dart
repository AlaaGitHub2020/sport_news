import 'package:dartz/dartz.dart';
import 'package:sport_news/domain/core/failures.dart';

Either<Failure<String?>, String?> validateStatus(String? input) {
  return right(input);
}

Either<Failure<int?>, int?> validateTotalResults(int? input) {
  return right(input);
}
