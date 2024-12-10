part of 'home_bloc.dart';

sealed class HomeEvent {}

class CalculateCorrectWordEvent extends HomeEvent {}

class TapLetterEvent extends HomeEvent {
  TapLetterEvent({required this.letter, required this.letterIndex});

  final String letter;
  final int letterIndex;
}

class ResetEvent extends HomeEvent {
  ResetEvent({required this.score});

  final int score;
}

class ShowWordTypeEvent extends HomeEvent {}
