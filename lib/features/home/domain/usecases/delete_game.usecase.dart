import 'package:hangman_game/features/home/domain/repositories/home_repository.dart';

class DeleteGameUsecase {
  const DeleteGameUsecase(this.repository);

  final HomeRepository repository;

  Future<T> call<T>() async => repository.delete();
}
