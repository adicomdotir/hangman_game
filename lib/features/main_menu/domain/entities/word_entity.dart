import 'package:hangman_game/features/main_menu/domain/entities/word_type_entity.dart';

class WordEntity {
  factory WordEntity.empty() {
    return WordEntity(
      id: 0,
      word: 'word',
      bookLevel: '0',
      bookLesson: '0',
      typeId: 0,
      wordType: WordTypeEntity(id: 0, name: '', shortName: ''),
      mean: 'mean',
    );
  }

  WordEntity({
    required this.id,
    required this.word,
    required this.bookLevel,
    required this.bookLesson,
    required this.typeId,
    required this.wordType,
    required this.mean,
  });
  final int id;
  final String word;
  final String bookLevel;
  final String bookLesson;
  final int typeId;
  final WordTypeEntity wordType;
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
      wordType: wordTypeEntity ?? wordType,
      mean: mean ?? this.mean,
    );
  }
}
