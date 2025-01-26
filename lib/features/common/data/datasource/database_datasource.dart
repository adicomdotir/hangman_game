import 'package:injectable/injectable.dart';

import '../models/index.dart';

@singleton
class DatabaseDataSource {
  // Todo: implement with sqlite
  final List<WordModel> _words = [
    WordModel(
      id: 0,
      word: 'word',
      bookLevel: '0',
      bookLesson: '0',
      typeId: 0,
      wordType: WordTypeModel(
        id: 0,
        name: 'name',
        shortName: 'shortName',
      ),
      mean: 'mean',
    ),
  ];

  void addWord(WordModel wordModel) {
    _words.add(wordModel);
  }

  void deleteWord(int id) {
    int index = _words.indexWhere(
      (word) => word.id == id,
    );
    _words.removeAt(index);
  }

  List<WordModel> fetchWords() {
    return _words;
  }
}
