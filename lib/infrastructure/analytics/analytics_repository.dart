import 'package:dartz/dartz.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_news/domain/analytics/analytics_failure.dart';
import 'package:sport_news/domain/analytics/i_analytics_repository.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';

@LazySingleton(as: IAnalyticsRepository)
class AnalyticsRepository implements IAnalyticsRepository {
  final FirebaseAnalytics _analytics;

  final log = getLogger();

  AnalyticsRepository(this._analytics);

  @override
  FirebaseAnalyticsObserver getAnalyticsObserver() {
    return FirebaseAnalyticsObserver(analytics: _analytics);
  }

  @override
  Future<Either<AnalyticsFailure, Unit>> logErrorHappened(
      {String? errorDescription}) async {
    try {
      await _analytics.logEvent(
        name: Strings.cErrorHappened,
        parameters: {Strings.cErrorDescription: errorDescription},
      );
      return right(unit);
    } catch (e) {
      log.e("ERROR :$e");
      return left(const AnalyticsFailure.serverError());
    }
  }

  @override
  Future<Either<AnalyticsFailure, Unit>> setUserProperties(
      {String? userId, String? userRole}) async {
    try {
      await _analytics.setUserId(id: userId);
      await _analytics.setUserProperty(
          name: Strings.cUserRole, value: userRole);
      return right(unit);
    } catch (e) {
      log.e("ERROR :$e");
      return left(const AnalyticsFailure.setUserPropertiesFailure());
    }
  }

  @override
  Future<Either<AnalyticsFailure, Unit>> logAppOpen() async {
    try {
      await _analytics.logAppOpen();
      return right(unit);
    } catch (e) {
      log.e("ERROR :$e");
      return left(const AnalyticsFailure.serverError());
    }
  }
}
