import 'package:hangman_game/arch/data/services/api/models/user/user_api_model.dart';

import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';
import '../../services/api/api_client.dart';

abstract class UsersRepository {
  /// Get current user
  Future<Result<List<User>>> getUsers();
}

class UsersRepositoryImpl extends UsersRepository {
  UsersRepositoryImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<List<User>>> getUsers() async {
    try {
      final result = await _apiClient.getUser();
      switch (result) {
        case Ok<List<UserApiModel>>():
          final userApiModel = result.value;
          return Result.ok(
            userApiModel
                .map(
                  (e) => User(
                    firstName: e.firstName,
                    lastName: e.lastName,
                    id: e.id,
                  ),
                )
                .toList(),
          );

        case Error<List<UserApiModel>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
