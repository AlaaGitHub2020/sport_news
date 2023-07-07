import 'package:sport_news/domain/core/failures.dart';

class UnexpectedValueErrors extends Error {
  final Failure valueFailure;

  UnexpectedValueErrors(this.valueFailure);

  @override
  String toString() {
    const String explanation =
        'Encountered a ValueFailure at an unrecoverable point. Termination.';
    return Error.safeToString("$explanation Failure was: $valueFailure");
  }
}
