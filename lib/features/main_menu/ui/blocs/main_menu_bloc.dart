import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:injectable/injectable.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';

@injectable
class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuBloc({required LogoutUsecase logoutUsecase})
      : _logoutUsecase = logoutUsecase,
        super(MainMenuInitial()) {
    on<LogoutEvent>(_logoutEvent);
  }

  final LogoutUsecase _logoutUsecase;

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
}
