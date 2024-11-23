import 'package:hangman_game/main.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  Future<String> signInEmailAndPassword(String email, String password);
  Future<void> signOut();
}

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<String> signInEmailAndPassword(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }

    return userId;
  }

  @override
  Future<void> signOut() async {
    await supabase.auth.signOut();
    return;
  }
}
