import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRemoteDataSource {
  Future<String> signInEmailAndPassword(String email, String password);
  Future<void> signOut();
}

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({required this.supabase});

  final Supabase supabase;

  @override
  Future<String> signInEmailAndPassword(String email, String password) async {
    final response = await supabase.client.auth.signInWithPassword(
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
    await supabase.client.auth.signOut();
    return;
  }
}
