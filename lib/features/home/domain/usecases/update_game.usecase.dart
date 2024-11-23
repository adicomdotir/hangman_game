import 'package:hangman_game/features/home/domain/repositories/home_repository.dart';

class UpdateGameUsecase {
  const UpdateGameUsecase(this.repository);

  final HomeRepository repository;

  Future<T> call<T>() async => repository.update();
}
