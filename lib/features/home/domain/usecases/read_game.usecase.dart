import 'package:hangman_game/features/home/domain/repositories/home_repository.dart';

class ReadGameUsecase {
  const ReadGameUsecase(this.repository);

  final HomeRepository repository;

  Future<T> call<T>() async => repository.read();
}
