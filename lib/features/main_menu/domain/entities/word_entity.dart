import 'package:hangman_game/features/main_menu/domain/entities/word_type_entity.dart';

class WordEntity {
  WordEntity({
    required this.id,
    required this.word,
    required this.bookLevel,
    required this.bookLesson,
    required this.typeId,
    required this.wordTypeEntity,
  });
  final int id;
  final String word;
  final String bookLevel;
  final String bookLesson;
  final int typeId;
  final WordTypeEntity wordTypeEntity;

  WordEntity copyWith({
    int? id,
    String? word,
    String? bookLevel,
    String? bookLesson,
    int? typeId,
    WordTypeEntity? wordTypeEntity,
  }) {
    return WordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      bookLevel: bookLevel ?? this.bookLevel,
      bookLesson: bookLesson ?? this.bookLesson,
      typeId: typeId ?? this.typeId,
      wordTypeEntity: wordTypeEntity ?? this.wordTypeEntity,
    );
  }
}
