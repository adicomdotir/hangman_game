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
  String letters = 'abcdefghijklmnopqrstuvwxyz';

  return List<KeyboardModel>.generate(
    26,
    (index) => KeyboardModel(letter: letters[index], isActive: true),
  );
}
