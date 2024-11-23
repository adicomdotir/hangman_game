import 'package:hangman_game/main.dart';

Future<List<Map<String, dynamic>>> fetchTopScores() async {
  final response = await supabase.from('leaderboard').select('''
    score,
    user_email
  ''');
  return response;
  // if (response.error != null) {
  //   // Handle error
  // } else {
  //   return response.data;
  // }
}

Future<List<Map<String, dynamic>>> fetchWords() async {
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
