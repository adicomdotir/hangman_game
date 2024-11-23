
		import 'package:hangman_game/features/leaderboard/domain/repositories/leaderboard.repository.dart';
		
		class UpdateLeaderboardUsecase {
			const UpdateLeaderboardUsecase(this.repository);
	  
			final LeaderboardRepository repository;
	  
			Future<T> call<T>() async => repository.update();
		}