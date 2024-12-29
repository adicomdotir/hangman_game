import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/home/index.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.addScoreUsecase})
      : super(HomeState.init(score: 50, wordEntity: WordEntity.empty())) {
    on<TapLetterEvent>(_tapLetterEvent);

    on<CalculateCorrectWordEvent>(_calculateCorrectWordEvent);

    on<ResetEvent>(_resetGameEvent);

    on<ShowWordTypeEvent>(_showWordTypeEvent);

    on<ShowWordMeanEvent>(_showWordMeanEvent);

    on<ShowLetterEvent>(_showLetterEvent);

    on<RemoveErrorEvent>(_removeErrorEvent);
  }

  final AddScoreUsecase addScoreUsecase;

  FutureOr<void> _tapLetterEvent(TapLetterEvent event, emit) {
    String letter = event.letter;
    List<KeyboardModel> updatedKeyboardModelList = state.keyModels.map((km) {
      return km.letter == event.letter ? km.copyWith(isActive: false) : km;
    }).toList();

    if (_letterExist(letter, state.word.word)) {
      String newCorrectWord =
          _replaceLetter(letter, state.word.word, state.correctWord);
      emit(
        state.copyWith(
          correctWord: newCorrectWord,
          keyModels: updatedKeyboardModelList,
        ),
      );
      if (_checkWin(state.word.word, state.correctWord)) {
        emit(
          state.copyWith(
            gameStatus: GameStatus.win,
            score:
                state.score + ((int.tryParse(state.word.bookLevel) ?? 1) * 10),
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          inCorrectWord: _replaceMistakeLetter(letter),
          keyModels: updatedKeyboardModelList,
          mistakeCount: state.mistakeCount + 1,
        ),
      );
      if (_checkLose(state.word.word, state.mistakeCount)) {
        emit(state.copyWith(gameStatus: GameStatus.lose));
        // TODO: Catch Error if score don't saved
        addScoreUsecase.call(state.score);
      }
    }
  }

  String _replaceMistakeLetter(String letter) {
    return state.inCorrectWord.replaceFirst('_', letter);
  }

  FutureOr<void> _calculateCorrectWordEvent(event, emit) {
    final newCorrectWord =
        state.word.word.split('').map((letter) => '_').join('');
    final newInCorrectWord =
        state.word.word.split('').map((letter) => '_').join('');
    emit(
      state.copyWith(
        correctWord: newCorrectWord,
        inCorrectWord: newInCorrectWord,
      ),
    );
  }

  bool _letterExist(String letter, String word) {
    return word.contains(letter);
  }

  String _replaceLetter(String letter, String word, String correctWord) {
    for (var i = 0; i < word.length; i++) {
      if (letter == word[i]) {
        correctWord = correctWord.replaceRange(i, i + 1, letter);
      }
    }
    return correctWord;
  }

  bool _checkWin(String word, String correctWord) {
    return word == correctWord;
  }

  bool _checkLose(String word, int mistakeCount) {
    return word.length <= mistakeCount;
  }

  FutureOr<void> _resetGameEvent(ResetEvent event, emit) {
    emit(
      HomeState.init(score: event.score, wordEntity: event.wordEntity),
    );
    add(CalculateCorrectWordEvent());
  }

  FutureOr<void> _showWordTypeEvent(
    ShowWordTypeEvent event,
    Emitter<HomeState> emit,
  ) {
    if (state.score >= 5) {
      emit(
        state.copyWith(
          wordHelpState: state.wordHelpState.copyWith(showWordType: true),
          score: state.score - 5,
        ),
      );
    } else {
      emit(state.copyWith(scoreIsLowError: true));
    }
  }

  FutureOr<void> _showWordMeanEvent(
    ShowWordMeanEvent event,
    Emitter<HomeState> emit,
  ) {
    if (state.score >= 15) {
      emit(
        state.copyWith(
          wordHelpState: state.wordHelpState.copyWith(showMeaning: true),
          score: state.score - 15,
        ),
      );
    } else {
      emit(state.copyWith(scoreIsLowError: true));
    }
  }

  FutureOr<void> _showLetterEvent(
    ShowLetterEvent event,
    Emitter<HomeState> emit,
  ) {
    if (state.score >= 10) {
      final correctWordArray = state.correctWord.split('');
      for (var idx = 0; idx < correctWordArray.length; idx++) {
        final letter = correctWordArray[idx];
        if (letter == '_') {
          correctWordArray[idx] = state.word.word.substring(idx, idx + 1);
          emit(
            state.copyWith(
              correctWord: correctWordArray.join(),
              score: state.score - 10,
            ),
          );
          if (_checkWin(state.word.word, state.correctWord)) {
            emit(
              state.copyWith(
                gameStatus: GameStatus.win,
                score: state.score +
                    ((int.tryParse(state.word.bookLevel) ?? 1) * 10),
              ),
            );
          }
          break;
        }
      }
    } else {
      emit(state.copyWith(scoreIsLowError: true));
    }
  }

  FutureOr<void> _removeErrorEvent(
    RemoveErrorEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(scoreIsLowError: false));
  }
}
