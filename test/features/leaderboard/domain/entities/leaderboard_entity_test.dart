import 'package:flutter_test/flutter_test.dart';
import 'package:hangman_game/features/leaderboard/index.dart';

void main() {
  group('LeaderboardEntity', () {
    test('copyWith returns a new instance with updated values', () {
      final originalEntity = LeaderboardEntity(
        score: 100,
        userEmail: 'test@example.com',
        lastScore: 50,
      );

      final updatedEntity = originalEntity.copyWith(
        score: 200,
        userEmail: 'new@example.com',
      );

      expect(updatedEntity.score, 200);
      expect(updatedEntity.userEmail, 'new@example.com');
      expect(updatedEntity.lastScore, 50); // Remains unchanged

      // Verify that the original entity remains unchanged
      expect(originalEntity.score, 100);
      expect(originalEntity.userEmail, 'test@example.com');
      expect(originalEntity.lastScore, 50);
    });

    test('copyWith returns the same instance if no arguments are provided', () {
      final originalEntity = LeaderboardEntity(
        score: 100,
        userEmail: 'test@example.com',
        lastScore: 50,
      );

      final copiedEntity = originalEntity.copyWith();

      expect(identical(originalEntity, copiedEntity), true);
    });

    test('constructor creates an instance with provided values', () {
      final entity = LeaderboardEntity(
        score: 100,
        userEmail: 'test@example.com',
        lastScore: 50,
      );

      expect(entity.score, 100);
      expect(entity.userEmail, 'test@example.com');
      expect(entity.lastScore, 50);
    });
  });
}
