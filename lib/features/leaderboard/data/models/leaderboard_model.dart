import 'dart:convert';

import 'package:hangman_game/features/leaderboard/domain/entities/leaderboard_entity.dart';

class LeaderboardModel extends LeaderboardEntity {
  LeaderboardModel({
    required super.score,
    required super.userEmail,
  });

  factory LeaderboardModel.fromMap(Map<String, dynamic> map) {
    return LeaderboardModel(
      score: map['score'].toInt() as int,
      userEmail: map['user_email'] as String,
    );
  }

  factory LeaderboardModel.fromJson(String source) =>
      LeaderboardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'score': score,
      'user_email': userEmail,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'Leaderboard_model(score: $score, user_email: $userEmail)';

  @override
  bool operator ==(covariant LeaderboardModel other) {
    if (identical(this, other)) return true;

    return other.score == score && other.userEmail == userEmail;
  }

  @override
  int get hashCode => score.hashCode ^ userEmail.hashCode;
}
