part of 'home_bloc.dart';

enum GameStatus {
  normal,
  win,
  lose,
}

class WordHelpState {
  WordHelpState({required this.showWordType, required this.showMeaning});

  factory WordHelpState.empty() =>
      WordHelpState(showWordType: false, showMeaning: false);

  final bool showMeaning;
  final bool showWordType;

  WordHelpState copyWith({
    bool? showMeaning,
    bool? showWordType,
  }) {
    return WordHelpState(
      showMeaning: showMeaning ?? this.showMeaning,
      showWordType: showWordType ?? this.showWordType,
    );
  }
}

class HomeState {
  factory HomeState.init({required int score}) {
    int rnd = Random().nextInt(wordList.length);
    WordEntity? word;
    try {
      word = wordList[rnd];
    } catch (e) {
      debugPrint(e.toString());
    }
    return HomeState(
      word: word!,
      correctWord: '',
      inCorrectWord: '',
      keyModels: generateKeyboardList(),
      gameStatus: GameStatus.normal,
      score: score,
      mistakeCount: 0,
      wordHelpState: WordHelpState.empty(),
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
    required this.wordHelpState,
  });

  final WordEntity word;
  final String correctWord;
  final String inCorrectWord;
  final GameStatus gameStatus;
  final List<KeyboardModel> keyModels;
  final int score;
  final int mistakeCount;
  final WordHelpState wordHelpState;

  HomeState copyWith({
    String? correctWord,
    String? inCorrectWord,
    GameStatus? gameStatus,
    List<KeyboardModel>? keyModels,
    int? score,
    int? mistakeCount,
    WordHelpState? wordHelpState,
  }) {
    return HomeState(
      word: word,
      correctWord: correctWord ?? this.correctWord,
      inCorrectWord: inCorrectWord ?? this.inCorrectWord,
      gameStatus: gameStatus ?? this.gameStatus,
      keyModels: keyModels ?? this.keyModels,
      score: score ?? this.score,
      mistakeCount: mistakeCount ?? this.mistakeCount,
      wordHelpState: wordHelpState ?? this.wordHelpState,
    );
  }
}
