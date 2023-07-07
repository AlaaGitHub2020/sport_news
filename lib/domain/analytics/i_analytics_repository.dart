import 'package:dartz/dartz.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:sport_news/domain/analytics/analytics_failure.dart';

abstract class IAnalyticsRepository {
  FirebaseAnalyticsObserver getAnalyticsObserver();

  Future<Either<AnalyticsFailure, Unit>> setUserProperties(
      {String? userId, String? userRole});

  Future<Either<AnalyticsFailure, Unit>> logAppOpen();

  Future<Either<AnalyticsFailure, Unit>> logErrorHappened(
      {String? errorDescription});
}
