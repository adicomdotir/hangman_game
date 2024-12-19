import 'package:hangman_game/features/main_menu/domain/entities/word_type_entity.dart';

class WordEntity {
  WordEntity({
    required this.id,
    required this.word,
    required this.bookLevel,
    required this.bookLesson,
    required this.typeId,
    required this.wordTypeEntity,
    required this.mean,
  });
  final int id;
  final String word;
  final String bookLevel;
  final String bookLesson;
  final int typeId;
  final WordTypeEntity wordTypeEntity;
  final String mean;

  WordEntity copyWith({
    int? id,
    String? word,
    String? bookLevel,
    String? bookLesson,
    int? typeId,
    WordTypeEntity? wordTypeEntity,
    String? mean,
  }) {
    return WordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      bookLevel: bookLevel ?? this.bookLevel,
      bookLesson: bookLesson ?? this.bookLesson,
      typeId: typeId ?? this.typeId,
      wordTypeEntity: wordTypeEntity ?? this.wordTypeEntity,
      mean: mean ?? this.mean,
    );
  }
}
