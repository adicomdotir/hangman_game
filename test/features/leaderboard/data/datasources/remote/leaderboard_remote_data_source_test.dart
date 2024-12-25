import 'package:mockito/annotations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@GenerateMocks([Supabase])
void main() {
  // late LeaderboardRemoteDataSourceImpl dataSource;
  // late MockSupabaseClient mockSupabaseClient;
  // late MockSupabaseQueryBuilder mockSupabaseQueryBuilder;
  // late MockPostgrestResponse mockPostgrestResponse;

  // setUp(() {
  //   mockSupabaseClient = MockSupabaseClient();
  //   mockSupabaseQueryBuilder = MockSupabaseQueryBuilder();
  //   mockPostgrestResponse = MockPostgrestResponse();

  //   dataSource = LeaderboardRemoteDataSourceImpl(supabase: MockSupabase());

  //   when(mockSupabaseClient.from('leaderboard'))
  //       .thenReturn(mockSupabaseQueryBuilder);

  //   when(mockSupabaseQueryBuilder.select('any'))
  //       .thenReturn(mockSupabaseQueryBuilder);
  //   when(mockSupabaseQueryBuilder.order('score'))
  //       .thenReturn(mockSupabaseQueryBuilder);

  //   when(mockSupabaseQueryBuilder.execute())
  //       .thenAnswer((_) async => mockPostgrestResponse);
  // });

  // test(
  //   'should return List<LeaderboardModel> when data fetching is successful',
  //   () async {
  //     // arrange
  //     final tMapList = [
  //       {
  //         'score': 100,
  //         'user_email': 'test@example.com',
  //         'last_score': 90,
  //       },
  //       {
  //         'score': 90,
  //         'user_email': 'test2@example.com',
  //         'last_score': 80,
  //       }
  //     ];

  //     when(mockPostgrestResponse.data).thenReturn(tMapList);

  //     // act
  //     final result = await dataSource.fetchTopScores();

  //     // assert
  //     expect(result, [
  //       LeaderboardModel(
  //         userEmail: 'test@example.com',
  //         score: 100,
  //         lastScore: 90,
  //       ),
  //       LeaderboardModel(
  //         userEmail: 'test2@example.com',
  //         score: 90,
  //         lastScore: 80,
  //       ),
  //     ]);
  //   },
  // );
}
