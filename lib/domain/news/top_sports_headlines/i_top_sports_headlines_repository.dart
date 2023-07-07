import 'package:dartz/dartz.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines_failure.dart';

abstract class ITopSportsHeadlinesRepository {
  Future<Either<TopSportsHeadlinesFailure, TopSportsHeadlines>> fetchNewsData();
}
