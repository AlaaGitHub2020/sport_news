part of 'remote_url_bloc.dart';

@freezed
class RemoteUrlState with _$RemoteUrlState {
  const factory RemoteUrlState.initial() = _Initial;

  const factory RemoteUrlState.actionInProgress() = _ActionInProgress;

  const factory RemoteUrlState.actionFailure(
      RemoteConfigFailure remoteConfigFailure) = _ActionFailure;

  const factory RemoteUrlState.actionSuccess(
      bool remoteUrlReceived, String? theUrl) = ActionSuccess;
}
