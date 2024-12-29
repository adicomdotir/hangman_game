part of 'home_bloc.dart';

sealed class HomeEvent {}

class CalculateCorrectWordEvent extends HomeEvent {}

class TapLetterEvent extends HomeEvent {
  TapLetterEvent({required this.letter, required this.letterIndex});

  final String letter;
  final int letterIndex;
}

class ResetEvent extends HomeEvent {
  ResetEvent({required this.score, required this.wordEntity});

  final int score;
  final WordEntity wordEntity;
}

class ShowWordTypeEvent extends HomeEvent {}

class ShowWordMeanEvent extends HomeEvent {}

class ShowLetterEvent extends HomeEvent {}

class RemoveErrorEvent extends HomeEvent {}
