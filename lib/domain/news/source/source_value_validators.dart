import 'package:dartz/dartz.dart';
import 'package:sport_news/domain/core/failures.dart';

Either<Failure<String?>, String?> validateId(String? input) {
  return right(input);
}

Either<Failure<String?>, String?> validateName(String? input) {
  return right(input);
}
