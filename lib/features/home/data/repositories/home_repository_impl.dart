import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/common/data/datasource/database_datasource.dart';
import 'package:hangman_game/features/common/data/models/index.dart';
import 'package:hangman_game/features/home/index.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.databaseDataSource,
  });

  final HomeRemoteDataSource homeRemoteDataSource;
  final DatabaseDataSource databaseDataSource;

  @override
  Future<Either<Failure, void>> addScore(int score) async {
    try {
      final res = await homeRemoteDataSource.addScore(score);
      return Right(res);
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addWordToDatabase(WordEntity wordEntity) async {
    try {
      final res = databaseDataSource.addWord(WordModel.fromEntiry(wordEntity));
      return Right(res);
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }
}
