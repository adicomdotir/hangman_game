import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/leaderboard/data/datasources/remote/leaderboard_remote_data_source.dart';
import 'package:hangman_game/features/leaderboard/domain/index.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LeaderboardRepository)
class LeaderboardRepositoryImpl extends LeaderboardRepository {
  LeaderboardRepositoryImpl({required this.leaderboardRemoteDataSource});

  final LeaderboardRemoteDataSource leaderboardRemoteDataSource;

  @override
  Future<Either<Failure, List<LeaderboardEntity>>> fetchTopScores() async {
    try {
      final res = await leaderboardRemoteDataSource.fetchTopScores();
      return Right(
        res
            .map(
              (model) => LeaderboardEntity(
                score: model.score,
                userEmail: model.userEmail,
              ),
            )
            .toList(),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
