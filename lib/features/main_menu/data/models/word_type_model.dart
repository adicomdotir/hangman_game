import 'dart:convert';

import 'package:hangman_game/features/main_menu/domain/entities/word_type_entity.dart';

class WordTypeModel extends WordTypeEntity {
  WordTypeModel({
    required super.id,
    required super.name,
    required super.shortName,
  });

  factory WordTypeModel.fromMap(Map<String, dynamic> map) {
    return WordTypeModel(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      shortName: map['shord_name'] as String,
    );
  }

  factory WordTypeModel.fromJson(String source) =>
      WordTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'shord_name': shortName,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'WordTypeModel(id: $id, name: $name, shortName: $shortName)';

  @override
  bool operator ==(covariant WordTypeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.shortName == shortName;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ shortName.hashCode;
}
