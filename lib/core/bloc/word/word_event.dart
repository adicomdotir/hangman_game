import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';

abstract class WordEvent {}

class AddWordsEvent extends WordEvent {
  AddWordsEvent({required this.words});

  final List<WordEntity> words;
}
