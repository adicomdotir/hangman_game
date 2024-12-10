import 'dart:convert';

class Xxxxxx {
  Xxxxxx({
    required this.id,
    required this.word_types,
  });

  factory Xxxxxx.fromMap(Map<String, dynamic> map) {
    return Xxxxxx(
      id: map['id'].toInt() as int,
      word_types: Word_types.fromMap(map['word_types'] as Map<String, dynamic>),
    );
  }

  factory Xxxxxx.fromJson(String source) =>
      Xxxxxx.fromMap(json.decode(source) as Map<String, dynamic>);
  final int id;
  final Word_types word_types;

  Xxxxxx copyWith({
    int? id,
    Word_types? word_types,
  }) {
    return Xxxxxx(
      id: id ?? this.id,
      word_types: word_types ?? this.word_types,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'word_types': word_types.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Xxxxxx(id: $id, word_types: $word_types)';

  @override
  bool operator ==(covariant Xxxxxx other) {
    if (identical(this, other)) return true;

    return other.id == id && other.word_types == word_types;
  }

  @override
  int get hashCode => id.hashCode ^ word_types.hashCode;
}

class Word_types {
  Word_types({
    required this.id,
    required this.name,
    required this.shord_name,
  });

  factory Word_types.fromMap(Map<String, dynamic> map) {
    return Word_types(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      shord_name: map['shord_name'] as String,
    );
  }

  factory Word_types.fromJson(String source) =>
      Word_types.fromMap(json.decode(source) as Map<String, dynamic>);
  final int id;
  final String name;
  final String shord_name;

  Word_types copyWith({
    int? id,
    String? name,
    String? shord_name,
  }) {
    return Word_types(
      id: id ?? this.id,
      name: name ?? this.name,
      shord_name: shord_name ?? this.shord_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'shord_name': shord_name,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'Word_types(id: $id, name: $name, shord_name: $shord_name)';

  @override
  bool operator ==(covariant Word_types other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.shord_name == shord_name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ shord_name.hashCode;
}
