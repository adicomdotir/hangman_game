import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/route/route.dart';

import '../blocs/game_bloc.dart';
import '../widgets/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    calculateCorrectWord();
    super.initState();
  }

  void calculateCorrectWord() {
    context.read<GameBloc>().add(CalculateCorrectWordEvent());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Home Page'),
            actions: [
              IconButton(
                onPressed: () {
                  context.push(AppRoute.leaderboardPageRouteName);
                },
                icon: const Icon(Icons.report_gmailerrorred),
              ),
              IconButton(
                onPressed: () {
                  // signOut();
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Score: ${state.score}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                if (state.gameStatus != GameStatus.normal)
                  TextButton(
                    onPressed: () {
                      if (state.gameStatus == GameStatus.win) {
                        context
                            .read<GameBloc>()
                            .add(ResetGameEvent(score: state.score));
                      } else {
                        context.read<GameBloc>().add(ResetGameEvent(score: 0));
                      }
                    },
                    child: Text(
                      state.gameStatus == GameStatus.lose
                          ? 'RESET GAME'
                          : 'NEXT WORD',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 64,
                ),
                const Text(
                  'Guess Word',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _convertGameStatus(state),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  state.correctWord.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  state.inCorrectWord.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 6,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                KeyboardWidget(
                  key: GlobalKey(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _convertGameStatus(GameState state) {
    if (state.gameStatus == GameStatus.win) {
      return 'You Win';
    } else if (state.gameStatus == GameStatus.lose) {
      return 'You Lose';
    }
    return '';
  }
}
