import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';

abstract class MainMenuRepository {
  Future<Either<Failure, bool>> logout();
}
