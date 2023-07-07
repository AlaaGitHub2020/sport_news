import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_news/domain/api/api_failure.dart';
import 'package:sport_news/domain/api/i_api_repository.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';
import 'package:sport_news/domain/news/top_sports_headlines/i_top_sports_headlines_repository.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines_failure.dart';
import 'package:sport_news/infrastructure/news/top_sports_headlines/top_sports_headlines_data_transfer_object.dart';

@LazySingleton(as: ITopSportsHeadlinesRepository)
class TopSportsHeadlinesRepository implements ITopSportsHeadlinesRepository {
  final IAPIRepository _apiRepository;

  final log = getLogger();

  TopSportsHeadlinesRepository(this._apiRepository);

  @override
  Future<Either<TopSportsHeadlinesFailure, TopSportsHeadlines>>
      fetchNewsData() async {
    try {
      log.i("fetchNewsData Started");
      Either<APIFailure, Response<dynamic>> getDataResponse =
          await _apiRepository.getData(
        "${Strings.eAPITopHeadlinesEndPoint}${Strings.cAPICountry}=${Strings.cAPICountryValue}&${Strings.cAPICategory}=${Strings.cAPICategoryValue}&${Strings.cAPIKey}=${Strings.cAPIKeyValue}",
      );
      late TopSportsHeadlines? topSportsHeadlines;
      log.wtf("getDataResponse:$getDataResponse");
      getDataResponse.fold((failure) {
        log.e(failure);
      }, (response) {
        var decodedResponse = json.decode(response.data);
        topSportsHeadlines =
            TopSportsHeadlinesDto.fromJson(decodedResponse).toDomain();
        log.i("topSportsHeadlines : $topSportsHeadlines");
      });
      log.i("getDataResponse:$getDataResponse");
      if (topSportsHeadlines == null) {
        return left(const TopSportsHeadlinesFailure.fetchNewsDataFailure());
      } else {
        return right(topSportsHeadlines!);
      }
    } catch (e) {
      log.e(e);
      return left(const TopSportsHeadlinesFailure.fetchNewsDataFailure());
    }
  }
}
