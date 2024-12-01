part of 'main_menu_bloc.dart';

sealed class MainMenuState {}

class MainMenuInitial extends MainMenuState {}

class MainMenuError extends MainMenuState {}

class MainMenuLoading extends MainMenuState {}

class LogoutSuccess extends MainMenuState {}

class GetWordsSuccess extends MainMenuState {
  GetWordsSuccess(this.words);

  final List<WordEntity> words;
}
