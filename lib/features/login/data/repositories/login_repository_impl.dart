import 'package:dartz/dartz.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/login/index.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl({required this.remoteDataSource});

  final LoginRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> signInEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result =
          await remoteDataSource.signInEmailAndPassword(email, password);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
