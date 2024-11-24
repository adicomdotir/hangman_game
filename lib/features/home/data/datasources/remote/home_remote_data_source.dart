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
      var response = await supabase.client
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

      response = await supabase.client
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
}
