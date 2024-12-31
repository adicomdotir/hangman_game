import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:injectable/injectable.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';

@injectable
class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuBloc({
    required LogoutUsecase logoutUsecase,
    required GetWordsUsecase getWordsUsecase,
  })  : _logoutUsecase = logoutUsecase,
        _getWordsUsecase = getWordsUsecase,
        super(MainMenuInitial()) {
    on<LogoutEvent>(_logoutEvent);
    on<GetWordsEvent>(_getWordsEvent);
    on<ChangeStateInitailEvent>(_changeStateInitialEvent);
  }

  final LogoutUsecase _logoutUsecase;
  final GetWordsUsecase _getWordsUsecase;

  FutureOr<void> _logoutEvent(
    LogoutEvent event,
    Emitter<MainMenuState> emit,
  ) async {
    final res = await _logoutUsecase.call();
    res.fold(
      (error) {
        emit(MainMenuError());
      },
      (success) {
        emit(LogoutSuccess());
      },
    );
  }

  FutureOr<void> _getWordsEvent(
    GetWordsEvent event,
    Emitter<MainMenuState> emit,
  ) async {
    emit(MainMenuLoading());
    final res =
        await _getWordsUsecase.call(event.book, event.lesson, event.wordType);
    res.fold(
      (error) {
        emit(MainMenuError());
      },
      (success) {
        emit(GetWordsSuccess(success));
      },
    );
  }

  FutureOr<void> _changeStateInitialEvent(
    ChangeStateInitailEvent event,
    Emitter<MainMenuState> emit,
  ) async {
    emit(MainMenuInitial());
  }
}
