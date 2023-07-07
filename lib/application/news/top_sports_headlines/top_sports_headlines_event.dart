part of 'top_sports_headlines_bloc.dart';

@freezed
abstract class TopSportsHeadlinesEvent with _$TopSportsHeadlinesEvent {
  const factory TopSportsHeadlinesEvent.getNewsData() = _GetNewsData;
}
