import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangman_game/core/error/failure.dart';
import 'package:hangman_game/features/leaderboard/index.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'leaderboard_repository_impl_test.mocks.dart';

@GenerateMocks([LeaderboardRemoteDataSource])
void main() {
  late LeaderboardRepositoryImpl repository;
  late MockLeaderboardRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockLeaderboardRemoteDataSource();
    repository = LeaderboardRepositoryImpl(
      leaderboardRemoteDataSource: mockRemoteDataSource,
    );
  });

  group('fetchTopScores', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        final tLeaderboardModels = [
          LeaderboardModel(
            userEmail: 'test@example.com',
            score: 100,
            lastScore: 95,
          ),
          LeaderboardModel(
            userEmail: 'test2@example.com',
            score: 90,
            lastScore: 87,
          ),
        ];
        final tLeaderboardEntities = tLeaderboardModels
            .map(
              (model) => LeaderboardEntity(
                userEmail: model.userEmail,
                score: model.score,
                lastScore: model.lastScore,
              ),
            )
            .toList();

        when(mockRemoteDataSource.fetchTopScores())
            .thenAnswer((_) async => tLeaderboardModels);
        // act
        final result = await repository.fetchTopScores();
        // assert
        verify(mockRemoteDataSource.fetchTopScores());
        print(result);
        print(
          Right<Failure, List<LeaderboardEntity>>(tLeaderboardEntities),
        );
        expect(
          result,
          equals(
            Right<Failure, List<LeaderboardEntity>>(tLeaderboardEntities),
          ),
        );
        verify(mockRemoteDataSource.fetchTopScores());
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.fetchTopScores()).thenThrow(Exception());
        // act
        final result = await repository.fetchTopScores();
        // assert
        verify(mockRemoteDataSource.fetchTopScores());
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });
}
