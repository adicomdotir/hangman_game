import 'package:hangman_game/arch/data/repositories/users/users_repository.dart';
import 'package:hangman_game/arch/data/services/api/api_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repositories/auth/auth_repository.dart';

List<SingleChildWidget> get providersLocal {
  return [
    Provider(
      create: (context) => ApiClient(),
    ),
    ChangeNotifierProvider.value(
      value: AuthRepositoryImpl() as AuthRepository,
    ),
    Provider(
      create: (context) =>
          UsersRepositoryImpl(apiClient: context.read()) as UsersRepository,
    ),
  ];
}
