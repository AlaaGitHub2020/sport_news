import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:sport_news/domain/news/top_sports_headlines/i_top_sports_headlines_repository.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines.dart';
import 'package:sport_news/domain/news/top_sports_headlines/top_sports_headlines_failure.dart';

part 'top_sports_headlines_bloc.freezed.dart';

part 'top_sports_headlines_event.dart';

part 'top_sports_headlines_state.dart';

@injectable
class TopSportsHeadlinesBloc
    extends Bloc<TopSportsHeadlinesEvent, TopSportsHeadlinesState> {
  final ITopSportsHeadlinesRepository _topSportsHeadlinesRepository;
  final log = getLogger();

  TopSportsHeadlinesBloc(this._topSportsHeadlinesRepository)
      : super(const TopSportsHeadlinesState.initial()) {
    on<TopSportsHeadlinesEvent>(
      (event, emit) async {
        await event.map(
          getNewsData: (e) async {
            log.i("getNewsData Started");
            emit(const TopSportsHeadlinesState.loading());
            final failureOrSuccess =
                await _topSportsHeadlinesRepository.fetchNewsData();
            TopSportsHeadlinesState teamProfileUiState =
                failureOrSuccess.fold((failure) {
              return TopSportsHeadlinesState.actionFailure(failure);
            }, (success) {
              return TopSportsHeadlinesState.actionSuccess(success);
            });
            emit(teamProfileUiState);
          },
        );
      },
    );
  }
}
