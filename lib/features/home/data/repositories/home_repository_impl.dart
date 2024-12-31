import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/home/index.dart';
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
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }
}
