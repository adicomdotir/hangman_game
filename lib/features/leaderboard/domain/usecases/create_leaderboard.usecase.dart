
		import 'package:hangman_game/features/leaderboard/domain/repositories/leaderboard.repository.dart';
		
		class CreateLeaderboardUsecase {
			const CreateLeaderboardUsecase(this.repository);
	  
			final LeaderboardRepository repository;
	  
			Future<T> call<T>() async => repository.create();
		}