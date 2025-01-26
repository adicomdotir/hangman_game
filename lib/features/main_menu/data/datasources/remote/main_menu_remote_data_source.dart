import 'package:hangman_game/features/common/data/models/word_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MainMenuRemoteDataSource {
  Future<void> logout();

  Future<List<WordModel>> getWords(
    String book,
    String lesson,
    int wordType,
  );
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
  Future<List<WordModel>> getWords(
    String book,
    String lesson,
    int wordType,
  ) async {
    final response = await supabase.client
        .from('words')
        .select('''
      *,
      word_types (
        id,
        name,
        shord_name
      )
    ''')
        .filter('book_level', book == '0' ? 'neq' : 'eq', book)
        .filter('book_lesson', lesson == '0' ? 'neq' : 'eq', lesson)
        .filter('type_id', wordType == 0 ? 'neq' : 'eq', wordType);

    return response.map((obj) => WordModel.fromMap(obj)).toList();
  }
}
