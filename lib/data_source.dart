import 'package:hangman_game/main.dart';

Future<void> addScore(int score) async {
  final user = supabase.auth.currentUser;

  if (user != null) {
    var response = await supabase
        .from('leaderboard')
        .select()
        .eq('user_email', user.email ?? '');

    final body = {
      'user_email': user.email,
      'score': score,
    };
    if (response.isNotEmpty) {
      body['id'] = response.first['id'];
    }

    response = await supabase
        .from('leaderboard')
        .upsert(body)
        .eq('user_email', user.email ?? '');

    // if (response.error != null) {
    //   // Handle error
    // } else {
    //   // Score added successfully
    // }
  } else {
    // Handle the case where the user is not logged in
  }
}

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
