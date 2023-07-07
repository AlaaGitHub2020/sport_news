part of 'api_manager_bloc.dart';

@freezed
abstract class ApiManagerState with _$ApiManagerState {
  const factory ApiManagerState.initial() = _Initial;

  const factory ApiManagerState.actionInProgress() = _ActionInProgress;

  const factory ApiManagerState.actionFailure(APIFailure apiFailure) =
      _ActionFailure;

  const factory ApiManagerState.actionSuccess() = _ActionSuccess;
}
