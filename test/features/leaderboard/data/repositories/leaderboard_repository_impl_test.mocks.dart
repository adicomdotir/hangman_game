// Mocks generated by Mockito 5.4.4 from annotations
// in hangman_game/test/features/leaderboard/data/repositories/leaderboard_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:hangman_game/features/leaderboard/data/datasources/remote/leaderboard_remote_data_source.dart'
    as _i2;
import 'package:hangman_game/features/leaderboard/data/models/leaderboard_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [LeaderboardRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLeaderboardRemoteDataSource extends _i1.Mock
    implements _i2.LeaderboardRemoteDataSource {
  MockLeaderboardRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.LeaderboardModel>> fetchTopScores() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTopScores,
          [],
        ),
        returnValue: _i3.Future<List<_i4.LeaderboardModel>>.value(
            <_i4.LeaderboardModel>[]),
      ) as _i3.Future<List<_i4.LeaderboardModel>>);
}