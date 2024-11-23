
		import 'package:hangman_game/features/main_menu/domain/repositories/main_menu.repository.dart';
		
		class ReadMainMenuUsecase {
			const ReadMainMenuUsecase(this.repository);
	  
			final MainMenuRepository repository;
	  
			Future<T> call<T>() async => repository.read();
		}