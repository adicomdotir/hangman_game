import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/core/bloc/word/word_event.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class WordBloc extends Bloc<WordEvent, List<WordEntity>> {
  WordBloc() : super(List.empty()) {
    on<AddWordsEvent>(_addWordsEvent);
  }

  FutureOr<void> _addWordsEvent(
    AddWordsEvent event,
    Emitter<List<WordEntity>> emit,
  ) {
    emit(event.words);
  }
}
