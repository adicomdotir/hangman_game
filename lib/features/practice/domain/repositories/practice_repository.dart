import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';

abstract class PracticeRepository {
  Future<Either<Failure, List<WordEntity>>> getWords();
}
