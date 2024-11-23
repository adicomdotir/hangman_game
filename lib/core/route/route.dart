import 'package:go_router/go_router.dart';
import 'package:hangman_game/features/home/ui/screens/home_page.dart';
import 'package:hangman_game/features/leaderboard/ui/screens/leaderboard_page.dart';
import 'package:hangman_game/features/login/ui/screens/login_page.dart';
import 'package:hangman_game/features/splash/index.dart';

class AppRoute {
  AppRoute._();

  static String splashPageRouteName = '/';
  static String loginPageRouteName = '/login';
  static String homePageRouteName = '/home';
  static String leaderboardPageRouteName = '/leaderboard';
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
      builder: (context, state) => const LeaderboardPage(),
    ),
    GoRoute(
      path: AppRoute.splashPageRouteName,
      builder: (context, state) => const SplashPage(),
    ),
  ],
);
