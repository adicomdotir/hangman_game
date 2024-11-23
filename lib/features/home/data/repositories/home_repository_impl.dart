import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/home/data/datasources/remote/home_remote_data_source.dart';
import 'package:hangman_game/features/home/domain/index.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({required this.homeRemoteDataSource});

  final HomeRemoteDataSource homeRemoteDataSource;

  @override
  Future<Either<Failure, void>> addScore(int score) async {
    try {
      final res = await homeRemoteDataSource.addScore(score);
      return Right(res);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
