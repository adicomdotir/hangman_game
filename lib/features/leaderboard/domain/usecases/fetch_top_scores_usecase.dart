import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/leaderboard/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchTopScoresUsecase {
  const FetchTopScoresUsecase(this.repository);

  final LeaderboardRepository repository;

  Future<Either<Failure, List<LeaderboardEntity>>> call() async =>
      repository.fetchTopScores();
}
