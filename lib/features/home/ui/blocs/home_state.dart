part of 'home_bloc.dart';

enum GameStatus {
  normal,
  win,
  lose,
}

class HomeState {
  factory HomeState.init({required int score}) {
    int rnd = Random().nextInt(wordList.length);
    String word = 'word';
    try {
      word = wordList[rnd]['word'];
    } catch (e) {
      print(e.toString());
    }
    return HomeState(
      word: word,
      correctWord: '',
      inCorrectWord: '',
      keyModels: generateKeyboardList(),
      gameStatus: GameStatus.normal,
      score: score,
      mistakeCount: 0,
    );
  }

  HomeState({
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

  HomeState copyWith({
    String? correctWord,
    String? inCorrectWord,
    GameStatus? gameStatus,
    List<KeyboardModel>? keyModels,
    int? score,
    int? mistakeCount,
  }) {
    return HomeState(
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
