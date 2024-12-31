import 'package:hangman_game/features/leaderboard/index.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LeaderboardRemoteDataSource {
  Future<List<LeaderboardModel>> fetchTopScores();
}

@Injectable(as: LeaderboardRemoteDataSource)
class LeaderboardRemoteDataSourceImpl extends LeaderboardRemoteDataSource {
  LeaderboardRemoteDataSourceImpl({required Supabase supabase})
      : _supabase = supabase;

  final Supabase _supabase;

  @override
  Future<List<LeaderboardModel>> fetchTopScores() async {
    final response = await _supabase.client.from('leaderboard').select('''
    score,
    user_email,
    last_score
  ''').order('score');

    return response.map((obj) => LeaderboardModel.fromMap(obj)).toList();
  }
}
