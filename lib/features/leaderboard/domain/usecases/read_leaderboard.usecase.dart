
		import 'package:hangman_game/features/leaderboard/domain/repositories/leaderboard.repository.dart';
		
		class ReadLeaderboardUsecase {
			const ReadLeaderboardUsecase(this.repository);
	  
			final LeaderboardRepository repository;
	  
			Future<T> call<T>() async => repository.read();
		}