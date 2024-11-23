
		import 'package:hangman_game/features/main_menu/domain/repositories/main_menu.repository.dart';
		
		class UpdateMainMenuUsecase {
			const UpdateMainMenuUsecase(this.repository);
	  
			final MainMenuRepository repository;
	  
			Future<T> call<T>() async => repository.update();
		}