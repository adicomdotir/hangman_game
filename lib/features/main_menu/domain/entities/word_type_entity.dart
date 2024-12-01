class WordTypeEntity {
  WordTypeEntity({
    required this.id,
    required this.name,
    required this.shortName,
  });

  final int id;
  final String name;
  final String shortName;

  WordTypeEntity copyWith({
    int? id,
    String? name,
    String? shortName,
  }) {
    return WordTypeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
    );
  }

  @override
  String toString() =>
      'WordTypeEntity(id: $id, name: $name, shortName: $shortName)';
}

List<WordTypeEntity> wordTypes = [
  WordTypeEntity(
    id: 1,
    name: 'noun',
    shortName: 'n',
  ),
  WordTypeEntity(
    id: 2,
    name: 'verb',
    shortName: 'v',
  ),
  WordTypeEntity(
    id: 3,
    name: 'connective',
    shortName: 'conj',
  ),
  WordTypeEntity(
    id: 4,
    name: 'adjective',
    shortName: 'adj',
  ),
  WordTypeEntity(
    id: 5,
    name: 'adverb',
    shortName: 'adv',
  ),
  WordTypeEntity(
    id: 6,
    name: 'preposition',
    shortName: 'prep',
  ),
];
