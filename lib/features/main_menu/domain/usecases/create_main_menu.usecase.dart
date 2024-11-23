
		import 'package:hangman_game/features/main_menu/domain/repositories/main_menu.repository.dart';
		
		class CreateMainMenuUsecase {
			const CreateMainMenuUsecase(this.repository);
	  
			final MainMenuRepository repository;
	  
			Future<T> call<T>() async => repository.create();
		}