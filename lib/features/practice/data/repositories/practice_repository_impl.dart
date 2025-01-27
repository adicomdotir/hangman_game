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
    if (!databaseDataSource.isOpen()) {
      await databaseDataSource.open();
    }
    final res = await databaseDataSource.fetchWords();
    final mappedResult = res
        .map(
          (e) => e.toEntity(),
        )
        .toList();
    return Right(mappedResult);
  }

  @override
  Future<Either<Failure, void>> deleteWord(int id) async {
    if (!databaseDataSource.isOpen()) {
      await databaseDataSource.open();
    }
    databaseDataSource.deleteWord(id);
    return const Right(null);
  }
}
