import 'package:flutter/foundation.dart';

import '../../../utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  /// Returns true when the user is logged in
  /// Returns [Future] because it will load a stored auth state the first time.
  Future<bool> get isAuthenticated;

  /// Perform login
  Future<Result<void>> login({
    required String email,
    required String password,
  });

  /// Perform logout
  Future<Result<void>> logout();
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<bool> get isAuthenticated => Future.value(true);

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> logout() {
    throw UnimplementedError();
  }
}
