import 'package:flutter_test/flutter_test.dart';
import 'package:hangman_game/features/leaderboard/index.dart';

void main() {
  group('leaderboardModel', () {
    final tLeaderboardModel = LeaderboardModel(
      score: 10,
      userEmail: 'test@test.com',
      lastScore: 5,
    );

    test(
      'should be a subclass of LeaderboardEntity',
      () {
        expect(tLeaderboardModel, isA<LeaderboardEntity>());
      },
    );

    test(
      'should return a valid LeaderboardModel from a JSON',
      () async {
        final Map<String, dynamic> jsonMap = {
          'score': 10,
          'user_email': 'test@test.com',
          'last_score': 5,
        };
        final result = LeaderboardModel.fromMap(jsonMap);
        expect(result, tLeaderboardModel);
      },
    );

    test(
      'should return a JSON from a LeaderboardModel',
      () async {
        final result = tLeaderboardModel.toMap();
        final expectedMap = {
          'score': 10,
          'user_email': 'test@test.com',
        };
        expect(result, expectedMap);
      },
    );
  });
}
