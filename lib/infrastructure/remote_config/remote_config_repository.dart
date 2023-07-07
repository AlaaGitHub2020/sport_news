import 'package:dartz/dartz.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_news/domain/core/utilities/helper.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';
import 'package:sport_news/domain/remote_config/i_remote_config_repository.dart';
import 'package:sport_news/domain/remote_config/remote_config_failure.dart';

@LazySingleton(as: IRemoteConfigRepository)
class RemoteConfigRepository implements IRemoteConfigRepository {
  final FirebaseRemoteConfig _remoteConfig;

  final log = getLogger();

  RemoteConfigRepository(this._remoteConfig);

  @override
  Future<Either<RemoteConfigFailure, Unit>> setConfigSettings(
      {required int fetchTimeoutInMinutes,
      required int minimumFetchIntervalInHours}) async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration(minutes: fetchTimeoutInMinutes),

        //todo: if you need the firebase remote config to fetch data in less time change the next parameter!!
        minimumFetchInterval: Duration(hours: minimumFetchIntervalInHours),
      ));
      return right(unit);
    } catch (e) {
      log.e("ERROR :$e");
      return left(const RemoteConfigFailure.serverError());
    }
  }

  @override
  Future<Either<RemoteConfigFailure, String>> fetchAndActivate() async {
    try {
      await _remoteConfig.fetchAndActivate();
      bool theDeviceIsEmulator = await Helper().checkIsEmulator();

      Either<RemoteConfigFailure, String> remoteUrlOrFailure =
          await getRemoteUrlString();

      if (remoteUrlOrFailure.isRight()) {
        log.i("remoteUrlOrFailure:$remoteUrlOrFailure");
        String urlRemoteConfig = remoteUrlOrFailure.getOrElse(() => "");
        if ((urlRemoteConfig == "") || (theDeviceIsEmulator)) {
          log.w("urlRemoteConfig : $urlRemoteConfig");
          return left(const RemoteConfigFailure.urlEmpty());
        } else {
          log.i("urlRemoteConfig : $urlRemoteConfig");
          await SharedPreferences.getInstance().then((value) async {
            value.setString(Strings.cLocalUrl, urlRemoteConfig);
          });
          return right(urlRemoteConfig);
        }
      } else {
        return left(const RemoteConfigFailure.urlEmpty());
      }
    } catch (e) {
      log.e("ERROR :$e");
      return left(const RemoteConfigFailure.serverError());
    }
  }

  @override
  Future<Either<RemoteConfigFailure, String>> getRemoteUrlString() async {
    try {
      String remoteUrl = _remoteConfig.getString(Strings.cRemoteUrl);
      if (remoteUrl == "") {
        log.w(
            "URL IS EMPTY FROM FIREBASE REMOTE CONFIG !! remoteUrl:$remoteUrl");
        return left(const RemoteConfigFailure.urlEmpty());
      } else {
        log.w("remoteUrl:$remoteUrl");
        return right(remoteUrl);
      }
    } catch (e) {
      log.e("ERROR :$e");
      return left(const RemoteConfigFailure.serverError());
    }
  }
}
