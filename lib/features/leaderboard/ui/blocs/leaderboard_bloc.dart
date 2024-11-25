import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/leaderboard/index.dart';
import 'package:injectable/injectable.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

@injectable
class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc({required this.fetchTopScoresUsecase})
      : super(LeaderboardInitial()) {
    on<LeaderboardEvent>(_fetchTopUserEvent);
  }

  FutureOr<void> _fetchTopUserEvent(event, emit) async {
    emit(LeaderboardLoading());
    final res = await fetchTopScoresUsecase.call();
    res.fold(
      (error) {
        emit(LeaderboardError());
      },
      (success) {
        emit(LeaderboardLoaded(data: success));
      },
    );
  }

  final FetchTopScoresUsecase fetchTopScoresUsecase;
}
