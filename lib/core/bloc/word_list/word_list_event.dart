import 'package:hangman_game/features/main_menu/index.dart';

abstract class WordListEvent {}

class AddWordListEvent extends WordListEvent {
  AddWordListEvent({required this.words});

  final List<WordEntity> words;
}
