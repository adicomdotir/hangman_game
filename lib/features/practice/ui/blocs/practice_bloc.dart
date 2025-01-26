import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:hangman_game/features/practice/domain/usecases/get_words_local_usecase.dart';
import 'package:injectable/injectable.dart';

part 'practice_event.dart';
part 'practice_state.dart';

@injectable
class PracticeBloc extends Bloc<PracticeEvent, PracticeState> {
  PracticeBloc({
    required GetWordsLocalUsecase getWordsLocalUsecase,
  })  : _getWordsLocalUsecase = getWordsLocalUsecase,
        super(PracticeInitial()) {
    on<GetWordsLocalEvent>(_getWordsLocalEvent);
  }

  final GetWordsLocalUsecase _getWordsLocalUsecase;

  FutureOr<void> _getWordsLocalEvent(
    GetWordsLocalEvent event,
    Emitter<PracticeState> emit,
  ) async {
    emit(PracticeLoading());
    final res = await _getWordsLocalUsecase.call();
    res.fold(
      (error) {
        emit(PracticeError());
      },
      (success) {
        emit(PracticeSuccess(success));
      },
    );
  }
}
