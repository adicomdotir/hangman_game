class LeaderboardEntity {
  LeaderboardEntity({
    required this.score,
    required this.userEmail,
    required this.lastScore,
  });

  final int score;
  final String userEmail;
  final int lastScore;

  LeaderboardEntity copyWith({
    int? score,
    String? userEmail,
    int? lastScore,
  }) {
    return LeaderboardEntity(
      score: score ?? this.score,
      userEmail: userEmail ?? this.userEmail,
      lastScore: lastScore ?? this.lastScore,
    );
  }
}
