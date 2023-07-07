part of 'top_sports_headlines_bloc.dart';

@freezed
abstract class TopSportsHeadlinesState with _$TopSportsHeadlinesState {
  const factory TopSportsHeadlinesState.initial() = _Initial;

  const factory TopSportsHeadlinesState.loading() = _Loading;

  const factory TopSportsHeadlinesState.actionFailure(
      TopSportsHeadlinesFailure topSportsHeadlinesFailure) = _ActionFailure;

  const factory TopSportsHeadlinesState.actionSuccess(
      TopSportsHeadlines topSportsHeadlines) = _ActionSuccess;
}
