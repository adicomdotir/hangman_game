import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/practice/domain/repositories/practice_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteWordUsecase {
  const DeleteWordUsecase(this.repository);

  final PracticeRepository repository;

  Future<Either<Failure, void>> call(int id) async => repository.deleteWord(id);
}
