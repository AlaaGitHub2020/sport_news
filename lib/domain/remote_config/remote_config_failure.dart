import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_failure.freezed.dart';

@freezed
class RemoteConfigFailure with _$RemoteConfigFailure {
  const factory RemoteConfigFailure.urlEmpty() = UrlEmpty;

  const factory RemoteConfigFailure.serverError() = ServerError;

  const factory RemoteConfigFailure.unexpected() = Unexpected;
}
