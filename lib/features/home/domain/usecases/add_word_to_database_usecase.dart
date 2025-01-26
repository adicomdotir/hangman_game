import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/home/index.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddWordToDatabaseUseCase {
  const AddWordToDatabaseUseCase(this.repository);

  final HomeRepository repository;

  Future<Either<Failure, void>> call(WordEntity wordEntity) =>
      repository.addWordToDatabase(wordEntity);
}
