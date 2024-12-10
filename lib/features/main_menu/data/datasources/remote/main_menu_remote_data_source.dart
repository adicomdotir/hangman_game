import 'package:hangman_game/features/main_menu/data/models/word_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MainMenuRemoteDataSource {
  Future<void> logout();

  Future<List<WordModel>> getWords();
}

@Injectable(as: MainMenuRemoteDataSource)
class MainMenuRemoteDataSourceImpl extends MainMenuRemoteDataSource {
  MainMenuRemoteDataSourceImpl({required this.supabase});

  final Supabase supabase;

  @override
  Future<void> logout() async {
    return await supabase.client.auth.signOut();
  }

  @override
  Future<List<WordModel>> getWords() async {
    final response = await supabase.client.from('words').select('''
      *,
      word_types (
        id,
        name,
        shord_name
      )
    ''');

    print(response);

    return response.map((obj) => WordModel.fromMap(obj)).toList();
  }
}
