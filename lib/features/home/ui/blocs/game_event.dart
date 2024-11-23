part of 'game_bloc.dart';

sealed class GameEvent {}

class CalculateCorrectWordEvent extends GameEvent {}

class TapLetterEvent extends GameEvent {
  TapLetterEvent({required this.letter, required this.letterIndex});

  final String letter;
  final int letterIndex;
}

class ResetGameEvent extends GameEvent {
  ResetGameEvent({required this.score});

  final int score;
}
