import 'package:dartz/dartz.dart';
import 'package:sport_news/domain/remote_config/remote_config_failure.dart';

abstract class IRemoteConfigRepository {
  Future<Either<RemoteConfigFailure, Unit>> setConfigSettings(
      {required int fetchTimeoutInMinutes,
      required int minimumFetchIntervalInHours});

  Future<Either<RemoteConfigFailure, String>> fetchAndActivate();

  Future<Either<RemoteConfigFailure, String>> getRemoteUrlString();
}
