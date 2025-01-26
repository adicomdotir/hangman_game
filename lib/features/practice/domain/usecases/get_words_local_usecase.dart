import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:hangman_game/features/practice/domain/repositories/practice_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWordsLocalUsecase {
  const GetWordsLocalUsecase(this.repository);

  final PracticeRepository repository;

  Future<Either<Failure, List<WordEntity>>> call() async =>
      repository.getWords();
}
