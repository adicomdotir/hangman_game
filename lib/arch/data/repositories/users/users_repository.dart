import 'package:hangman_game/arch/data/services/api/models/user/user_api_model.dart';

import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';
import '../../services/api/api_client.dart';

abstract class UsersRepository {
  /// Get current user
  Future<Result<User>> getUsers();
}

class UsersRepositoryImpl extends UsersRepository {
  UsersRepositoryImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<User>> getUsers() async {
    try {
      final result = await _apiClient.getUser();
      switch (result) {
        case Ok<UserApiModel>():
          final userApiModel = result.value;
          return Result.ok(
            User(
              id: userApiModel.id,
              firstName: userApiModel.firstName,
              lastName: userApiModel.lastName,
            ),
          );

        case Error<UserApiModel>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
