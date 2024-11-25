import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/leaderboard/index.dart';

abstract class LeaderboardRepository {
  Future<Either<Failure, List<LeaderboardEntity>>> fetchTopScores();
}
