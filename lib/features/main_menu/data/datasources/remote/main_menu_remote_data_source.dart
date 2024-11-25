import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MainMenuRemoteDataSource {
  Future<void> logout();
}

@Injectable(as: MainMenuRemoteDataSource)
class MainMenuRemoteDataSourceImpl extends MainMenuRemoteDataSource {
  MainMenuRemoteDataSourceImpl({required this.supabase});

  final Supabase supabase;

  @override
  Future<void> logout() async {
    return await supabase.client.auth.signOut();
  }
}
