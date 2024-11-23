import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/router/route.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Main Menu'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context.push(AppRoute.homePageRouteName);
              },
              child: const Text(
                'New Game',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {
                context.push(AppRoute.leaderboardPageRouteName);
              },
              child: const Text(
                'Leaderboard',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
