import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_news/domain/api/api_failure.dart';
import 'package:sport_news/domain/api/i_api_repository.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';

part 'api_manager_bloc.freezed.dart';
part 'api_manager_event.dart';
part 'api_manager_state.dart';

@injectable
class ApiManagerBloc extends Bloc<ApiManagerEvent, ApiManagerState> {
  final IAPIRepository _apiRepository;
  final log = getLogger();

  ApiManagerBloc(this._apiRepository) : super(const ApiManagerState.initial()) {
    on<ApiManagerEvent>(
      (event, emit) async {
        await event.map(
          getData: (e) async {
            log.i("getData Started");
            emit(const ApiManagerState.actionInProgress());
            final failureOrSuccess = await _apiRepository.getData(e.endPoint);
            ApiManagerState apiManagerState;
            apiManagerState = failureOrSuccess.fold(
                (failure) => ApiManagerState.actionFailure(failure),
                (success) => const ApiManagerState.actionSuccess());
            emit(apiManagerState);
          },
        );
      },
    );
  }
}
