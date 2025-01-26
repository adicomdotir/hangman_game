import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, void>> addScore(int score);

  Future<Either<Failure, void>> addWordToDatabase(WordEntity wordEntity);
}
