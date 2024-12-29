import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/core/bloc/word_list/word_list_event.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class WordListBloc extends Bloc<WordListEvent, List<WordEntity>> {
  WordListBloc() : super(List.empty()) {
    on<AddWordListEvent>(_addWordsEvent);
  }

  FutureOr<void> _addWordsEvent(
    AddWordListEvent event,
    Emitter<List<WordEntity>> emit,
  ) {
    emit(event.words);
  }
}
