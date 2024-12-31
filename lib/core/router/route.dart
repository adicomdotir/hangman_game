import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/di/injectable.dart';
import 'package:hangman_game/features/home/index.dart';
import 'package:hangman_game/features/leaderboard/index.dart';
import 'package:hangman_game/features/login/index.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:hangman_game/features/splash/index.dart';

class AppRoute {
  AppRoute._();

  static String splashPageRouteName = '/';
  static String loginPageRouteName = '/login';
  static String homePageRouteName = '/home';
  static String leaderboardPageRouteName = '/leaderboard';
  static String mainMenuPageRouteName = '/main-menu';
}

// GoRouter configuration
final router = GoRouter(
  initialLocation: AppRoute.splashPageRouteName,
  routes: [
    GoRoute(
      path: AppRoute.loginPageRouteName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoute.homePageRouteName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoute.leaderboardPageRouteName,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<LeaderboardBloc>(),
        child: const LeaderboardPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.splashPageRouteName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoute.mainMenuPageRouteName,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<MainMenuBloc>(),
        child: const MainMenuPage(),
      ),
    ),
  ],
);
