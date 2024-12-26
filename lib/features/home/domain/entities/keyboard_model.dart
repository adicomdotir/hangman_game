class KeyboardModel {
  KeyboardModel({
    required this.letter,
    required this.isActive,
  });

  final String letter;
  final bool isActive;

  KeyboardModel copyWith({bool? isActive}) {
    return KeyboardModel(letter: letter, isActive: isActive ?? this.isActive);
  }
}

List<KeyboardModel> generateKeyboardList() {
  String letters = 'abcdefghijklmnopqrstuvwxyz  ';

  return List<KeyboardModel>.generate(
    28,
    (index) => KeyboardModel(letter: letters[index], isActive: true),
  ).map(toElement).toList();
}

KeyboardModel toElement(KeyboardModel model) {
  return model.letter == ' '
      ? model.copyWith(isActive: false)
      : model.copyWith(isActive: true);
}
