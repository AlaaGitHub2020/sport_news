import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';
import 'package:sport_news/domain/remote_config/i_remote_config_repository.dart';
import 'package:sport_news/domain/remote_config/remote_config_failure.dart';

part 'remote_url_bloc.freezed.dart';

part 'remote_url_event.dart';

part 'remote_url_state.dart';

@injectable
class RemoteUrlBloc extends Bloc<RemoteUrlEvent, RemoteUrlState> {
  final IRemoteConfigRepository _remoteConfigRepository;
  final log = getLogger();

  RemoteUrlBloc(this._remoteConfigRepository)
      : super(const RemoteUrlState.initial()) {
    on<RemoteUrlEvent>(
      (event, emit) async {
        await event.map(
          getRemoteUrl: (e) async {
            log.i("getRemoteUrl Started");
            emit(const RemoteUrlState.actionInProgress());
            RemoteUrlState remoteUrlState;
            await SharedPreferences.getInstance().then(
              (value) async {
                String? localUrl = value.getString(Strings.cLocalUrl);
                log.i('localUrl:$localUrl');
                if ((localUrl != null) && (localUrl != "")) {
                  log.i('localUrl:$localUrl');
                  remoteUrlState = RemoteUrlState.actionSuccess(true,localUrl);
                  emit(remoteUrlState);
                }
                else {
                  log.e('localUrl:$localUrl');
                  Either<RemoteConfigFailure, String> possibleFailure =
                      await _remoteConfigRepository.fetchAndActivate();
                  remoteUrlState = possibleFailure.fold((failure) {
                    log.e("failure $failure");
                    return RemoteUrlState.actionFailure(failure);
                  },
                          (success) {
                    log.i("success $success");
                    if (success!='') {
                      log.i("success: $success ");
                      return RemoteUrlState.actionSuccess(true,success);
                    } else {
                      log.i("ENTERED TO else ");
                      return const RemoteUrlState.actionFailure(
                          RemoteConfigFailure.urlEmpty());
                    }
                  });

                  emit(remoteUrlState);
                }
              },
            );
          },
        );
      },
    );
  }
}
