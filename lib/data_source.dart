import 'package:hangman_game/core/di/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<Map<String, dynamic>>> fetchWords() async {
  final supabase = getIt<Supabase>().client;

  final response = await supabase.from('words').select('''
    word,
    book_level,
    book_lesson
  ''');
  return response;
  // if (response.error != null) {
  //   // Handle error
  // } else {
  //   return response.data;
  // }
}
