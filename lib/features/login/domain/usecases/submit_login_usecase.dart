import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/login/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubmitLoginUsecase {
  const SubmitLoginUsecase(this.repository);

  final LoginRepository repository;

  Future<Either<Failure, String>> call(String email, String password) async =>
      repository.signInEmailAndPassword(email, password);
}
