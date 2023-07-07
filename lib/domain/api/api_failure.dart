import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
abstract class APIFailure with _$APIFailure {
  const factory APIFailure.unexpected() = _Unexpected;

  const factory APIFailure.failedToFetchData() = _FailedToFetchData;
}
