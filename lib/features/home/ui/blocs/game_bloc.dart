import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/data_source.dart';
import 'package:hangman_game/words.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.init(score: 0)) {
    on<TapLetterEvent>(_tapLetterEvent);

    on<CalculateCorrectWordEvent>(_calculateCorrectWordEvent);

    on<ResetGameEvent>(_resetGameEvent);
  }

  FutureOr<void> _tapLetterEvent(TapLetterEvent event, emit) {
    String letter = event.letter;
    List<KeyboardModel> updatedKeyboardModelList = state.keyModels.map((km) {
      return km.letter == event.letter ? km.copyWith(isActive: false) : km;
    }).toList();

    if (_letterExist(letter, state.word)) {
      String newCorrectWord =
          _replaceLetter(letter, state.word, state.correctWord);
      emit(
        state.copyWith(
          correctWord: newCorrectWord,
          keyModels: updatedKeyboardModelList,
        ),
      );
      if (_checkWin(state.word, state.correctWord)) {
        emit(
          state.copyWith(
            gameStatus: GameStatus.win,
            score: state.score + 10,
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
      if (_checkLose(state.word, state.mistakeCount)) {
        emit(state.copyWith(gameStatus: GameStatus.lose));
        addScore(state.score);
      }
    }
  }

  String _replaceMistakeLetter(String letter) {
    return state.inCorrectWord.replaceFirst('_', letter);
  }

  FutureOr<void> _calculateCorrectWordEvent(event, emit) {
    final newCorrectWord = state.word.split('').map((letter) => '_').join('');
    final newInCorrectWord = state.word.split('').map((letter) => '_').join('');
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

  FutureOr<void> _resetGameEvent(ResetGameEvent event, emit) {
    emit(
      GameState.init(score: event.score),
    );
    add(CalculateCorrectWordEvent());
  }
}
