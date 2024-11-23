
		import 'package:hangman_game/features/main_menu/domain/repositories/main_menu.repository.dart';
		
		class DeleteMainMenuUsecase {
			const DeleteMainMenuUsecase(this.repository);
	  
			final MainMenuRepository repository;
	  
			Future<T> call<T>() async => repository.delete();
		}