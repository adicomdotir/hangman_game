import 'dart:convert';

import 'package:hangman_game/features/common/data/models/word_type_model.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';

class WordModel extends WordEntity {
  factory WordModel.fromEntiry(WordEntity wordEntity) {
    return WordModel(
      id: wordEntity.id,
      word: wordEntity.word,
      bookLevel: wordEntity.bookLevel,
      bookLesson: wordEntity.bookLesson,
      typeId: wordEntity.typeId,
      wordType: wordEntity.wordType,
      mean: wordEntity.mean,
    );
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      id: map['id'].toInt() as int,
      word: map['word'] as String,
      bookLevel: map['book_level'] as String,
      bookLesson: map['book_lesson'] as String,
      typeId: map['type_id'].toInt() as int,
      wordType:
          WordTypeModel.fromMap(map['word_types'] as Map<String, dynamic>),
      mean: map['mean'] as String,
    );
  }

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source) as Map<String, dynamic>);
  WordModel({
    required super.id,
    required super.word,
    required super.bookLevel,
    required super.bookLesson,
    required super.typeId,
    required super.wordType,
    required super.mean,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'word': word,
      'bookLevel': bookLevel,
      'bookLesson': bookLesson,
      'typeId': typeId,
      'wordType':
          (wordType as WordTypeModel).toMap(), // Convert WordTypeModel to map
      'mean': mean,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Wordmodel(id: $id, word: $word, bookLevel: $bookLevel, bookLesson: $bookLesson, typeId: $typeId)';
  }

  @override
  bool operator ==(covariant WordModel other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.word == word &&
        other.bookLevel == bookLevel &&
        other.bookLesson == bookLesson &&
        other.typeId == typeId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        word.hashCode ^
        bookLevel.hashCode ^
        bookLesson.hashCode ^
        typeId.hashCode;
  }

  WordEntity toEntity() => WordEntity(
        id: id,
        word: word,
        bookLevel: bookLevel,
        bookLesson: bookLesson,
        typeId: typeId,
        wordType: wordType,
        mean: mean,
      );
}
