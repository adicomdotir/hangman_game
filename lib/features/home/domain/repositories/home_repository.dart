import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, void>> addScore(int score);
}
