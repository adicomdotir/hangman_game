import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> signInEmailAndPassword(
    String email,
    String password,
  );
}
