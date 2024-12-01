import 'package:flutter_test/flutter_test.dart';
import 'package:hangman_game/features/login/data/datasources/remote/login_remote_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockSupabaseAuth extends Mock implements GoTrueClient {}

class MockGotrueSessionResponse extends Mock implements GotrueSessionResponse {}

void main() {
  late LoginRemoteDataSourceImpl dataSource;
  late MockSupabaseClient mockSupabaseClient;
  late MockSupabaseAuth mockSupabaseAuth;

  setUp(() {
    mockSupabaseClient = MockSupabaseClient();
    mockSupabaseAuth = MockSupabaseAuth();
    dataSource = LoginRemoteDataSourceImpl(supabase: mockSupabaseClient);

    when(mockSupabaseClient.client).thenReturn(mockSupabaseAuth);
  });

  group('signInEmailAndPassword', () {
    test('should return userId on successful login', () async {
      final mockResponse = MockGotrueSessionResponse();
      when(
        mockSupabaseAuth.signInWithPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        ),
      ).thenAnswer((_) async => mockResponse);
      when(mockResponse.user?.id).thenReturn('test_user_id');

      final result = await dataSource.signInEmailAndPassword(
        'test@email.com',
        'password123',
      );

      expect(result, 'test_user_id');
      verify(
        mockSupabaseAuth.signInWithPassword(
          email: 'test@email.com',
          password: 'password123',
        ),
      );
    });

    test('should throw UnimplementedError when userId is null', () async {
      final mockResponse = MockGotrueSessionResponse();
      when(
        mockSupabaseAuth.signInWithPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        ),
      ).thenAnswer((_) async => mockResponse);
      when(mockResponse.user?.id).thenReturn(null);

      expect(
        () async =>
            dataSource.signInEmailAndPassword('test@email.com', 'password123'),
        throwsA(isA<UnimplementedError>()),
      );
      verify(
        mockSupabaseAuth.signInWithPassword(
          email: 'test@email.com',
          password: 'password123',
        ),
      );
    });

    test('should propagate exceptions from supabase', () async {
      when(
        mockSupabaseAuth.signInWithPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        ),
      ).thenThrow(Exception('Test Exception'));

      expect(
        () async =>
            dataSource.signInEmailAndPassword('test@email.com', 'password123'),
        throwsA(isA<Exception>()),
      );
      verify(
        mockSupabaseAuth.signInWithPassword(
          email: 'test@email.com',
          password: 'password123',
        ),
      );
    });
  });
}
