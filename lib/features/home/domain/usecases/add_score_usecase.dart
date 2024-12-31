import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/home/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddScoreUsecase {
  const AddScoreUsecase(this.repository);

  final HomeRepository repository;

  Future<Either<Failure, void>> call(int score) => repository.addScore(score);
}
