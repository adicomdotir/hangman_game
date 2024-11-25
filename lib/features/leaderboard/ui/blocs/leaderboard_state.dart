part of 'leaderboard_bloc.dart';

class LeaderboardState {}

class LeaderboardInitial extends LeaderboardState {}

class LeaderboardLoading extends LeaderboardState {}

class LeaderboardError extends LeaderboardState {}

class LeaderboardLoaded extends LeaderboardState {
  LeaderboardLoaded({required this.data});

  final List<LeaderboardEntity> data;
}
