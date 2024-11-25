import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainMenuRepository)
class MainMenuRepositoryImpl extends MainMenuRepository {
  MainMenuRepositoryImpl({required this.mainMenuRemoteDataSource});

  final MainMenuRemoteDataSource mainMenuRemoteDataSource;

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await mainMenuRemoteDataSource.logout();
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
