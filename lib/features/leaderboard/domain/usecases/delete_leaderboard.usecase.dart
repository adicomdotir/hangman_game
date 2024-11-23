
		import 'package:hangman_game/features/leaderboard/domain/repositories/leaderboard.repository.dart';
		
		class DeleteLeaderboardUsecase {
			const DeleteLeaderboardUsecase(this.repository);
	  
			final LeaderboardRepository repository;
	  
			Future<T> call<T>() async => repository.delete();
		}