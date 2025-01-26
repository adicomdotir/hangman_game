import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/common/data/datasource/database_datasource.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';
import 'package:hangman_game/features/practice/domain/repositories/practice_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PracticeRepository)
class PracticeRepositoryImpl extends PracticeRepository {
  PracticeRepositoryImpl({required this.databaseDataSource});

  DatabaseDataSource databaseDataSource;

  @override
  Future<Either<Failure, List<WordEntity>>> getWords() async {
    final res = databaseDataSource.fetchWords();
    return Right(res);
  }

  @override
  Future<Either<Failure, void>> deleteWord(int id) async {
    databaseDataSource.deleteWord(id);
    return const Right(null);
  }
}
