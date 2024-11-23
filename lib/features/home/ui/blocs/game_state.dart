part of 'game_bloc.dart';

enum GameStatus {
  normal,
  win,
  lose,
}

class GameState {
  factory GameState.init({required int score}) {
    int rnd = Random().nextInt(wordList.length);
    String word = 'word';
    try {
      word = wordList[rnd]['word'];
    } catch (e) {
      print(e.toString());
    }
    return GameState(
      word: word,
      correctWord: '',
      inCorrectWord: '',
      keyModels: generateKeyboardList(),
      gameStatus: GameStatus.normal,
      score: score,
      mistakeCount: 0,
    );
  }

  GameState({
    required this.word,
    required this.correctWord,
    required this.inCorrectWord,
    required this.keyModels,
    required this.gameStatus,
    required this.score,
    required this.mistakeCount,
  });

  final String word;
  final String correctWord;
  final String inCorrectWord;
  final GameStatus gameStatus;
  final List<KeyboardModel> keyModels;
  final int score;
  final int mistakeCount;

  GameState copyWith({
    String? correctWord,
    String? inCorrectWord,
    GameStatus? gameStatus,
    List<KeyboardModel>? keyModels,
    int? score,
    int? mistakeCount,
  }) {
    return GameState(
      word: word,
      correctWord: correctWord ?? this.correctWord,
      inCorrectWord: inCorrectWord ?? this.inCorrectWord,
      gameStatus: gameStatus ?? this.gameStatus,
      keyModels: keyModels ?? this.keyModels,
      score: score ?? this.score,
      mistakeCount: mistakeCount ?? this.mistakeCount,
    );
  }
}

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
