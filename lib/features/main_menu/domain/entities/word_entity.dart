class WordEntity {
  WordEntity({
    required this.id,
    required this.word,
    required this.bookLevel,
    required this.bookLesson,
    required this.typeId,
  });
  final int id;
  final String word;
  final String bookLevel;
  final String bookLesson;
  final int typeId;

  WordEntity copyWith({
    int? id,
    String? word,
    String? bookLevel,
    String? bookLesson,
    int? typeId,
  }) {
    return WordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      bookLevel: bookLevel ?? this.bookLevel,
      bookLesson: bookLesson ?? this.bookLesson,
      typeId: typeId ?? this.typeId,
    );
  }
}
