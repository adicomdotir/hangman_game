import 'package:flutter/foundation.dart';
import 'package:hangman_game/arch/data/repositories/users/users_repository.dart';
import 'package:hangman_game/arch/utils/result.dart';

import '../../../domain/models/user/user.dart';
import '../../../utils/commad.dart';

class UsersViewModel extends ChangeNotifier {
  UsersViewModel({required UsersRepository usersRepository})
      : _usersRepository = usersRepository {
    loadUsers = Command0(_loadUsers)..execute();
  }

  final UsersRepository _usersRepository;
  late final Command0 loadUsers;

  Future<Result<List<User>>> _loadUsers() async {
    final result = await _usersRepository.getUsers();
    return result;
  }
}
