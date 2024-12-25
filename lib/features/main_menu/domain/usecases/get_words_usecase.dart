import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWordsUsecase {
  const GetWordsUsecase(this.repository);

  final MainMenuRepository repository;

  Future<Either<Failure, List<WordEntity>>> call(
    String book,
    String lesson,
    int wordType,
  ) async =>
      repository.getWords(
        book,
        lesson,
        wordType,
      );
}
