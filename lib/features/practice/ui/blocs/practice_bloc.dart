import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:hangman_game/features/practice/domain/usecases/delete_word_usecase.dart';
import 'package:hangman_game/features/practice/domain/usecases/get_words_local_usecase.dart';
import 'package:injectable/injectable.dart';

part 'practice_event.dart';
part 'practice_state.dart';

@injectable
class PracticeBloc extends Bloc<PracticeEvent, PracticeState> {
  PracticeBloc({
    required GetWordsLocalUsecase getWordsLocalUsecase,
    required DeleteWordUsecase deleteWordUsecase,
  })  : _getWordsLocalUsecase = getWordsLocalUsecase,
        _deleteWordUsecase = deleteWordUsecase,
        super(PracticeInitial()) {
    on<GetWordsLocalEvent>(_getWordsLocalEvent);
    on<DeleteWordEvent>(_deleteWordEvent);
  }

  final GetWordsLocalUsecase _getWordsLocalUsecase;
  final DeleteWordUsecase _deleteWordUsecase;

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

  FutureOr<void> _deleteWordEvent(
    DeleteWordEvent event,
    Emitter<PracticeState> emit,
  ) async {
    emit(PracticeLoading());
    final res = await _deleteWordUsecase.call(event.id);
    res.fold(
      (error) {
        emit(PracticeError());
      },
      (success) {
        add(GetWordsLocalEvent());
      },
    );
  }
}
