import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUsecase {
  const LogoutUsecase(this.repository);

  final MainMenuRepository repository;

  Future<Either<Failure, bool>> call() async => repository.logout();
}
