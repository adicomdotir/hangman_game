part of 'main_menu_bloc.dart';

abstract class MainMenuEvent {}

class LogoutEvent extends MainMenuEvent {}

class GetWordsEvent extends MainMenuEvent {
  GetWordsEvent({
    required this.book,
    required this.lesson,
    required this.wordType,
  });

  final String book;
  final String lesson;
  final int wordType;
}

class ChangeStateInitailEvent extends MainMenuEvent {}
