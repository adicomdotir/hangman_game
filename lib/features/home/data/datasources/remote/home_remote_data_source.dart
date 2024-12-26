import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<void> addScore(int score);
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required this.supabase});

  final Supabase supabase;

  @override
  Future<void> addScore(int score) async {
    final user = supabase.client.auth.currentUser;

    if (user != null) {
      final fetchUserScoreResponse = await supabase.client
          .from('leaderboard')
          .select()
          .eq('user_email', user.email ?? '');

      if (fetchUserScoreResponse.isNotEmpty) {
        final oldScore = fetchUserScoreResponse.first['score'];

        final body = {
          'user_email': user.email,
          'score': score > oldScore ? score : oldScore,
          'last_score': score,
        };

        body['id'] = fetchUserScoreResponse.first['id'];

        await supabase.client.from('leaderboard').upsert(body);
      } else {
        final body = {
          'user_email': user.email,
          'score': score,
          'last_score': score,
        };
        await supabase.client.from('leaderboard').upsert(body);
      }

      // if (response.error != null) {
      //   // Handle error
      // } else {
      //   // Score added successfully
      // }
    } else {
      // Handle the case where the user is not logged in
    }
  }
}
