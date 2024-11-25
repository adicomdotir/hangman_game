class LeaderboardEntity {
  LeaderboardEntity({
    required this.score,
    required this.userEmail,
  });

  final int score;
  final String userEmail;

  LeaderboardEntity copyWith({
    int? score,
    String? userEmail,
  }) {
    return LeaderboardEntity(
      score: score ?? this.score,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}
