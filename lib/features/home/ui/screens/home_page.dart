import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/router/route.dart';
import 'package:hangman_game/features/home/ui/widgets/show_exit_popup.dart';
import 'package:hangman_game/features/home/ui/widgets/show_menu_dialog.dart';

import '../blocs/home_bloc.dart';
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
    context.read<HomeBloc>().add(CalculateCorrectWordEvent());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.gameStatus == GameStatus.lose) {
          showMenuDialog(context).then(
            (value) {
              if (context.mounted) {
                if (value == MenuDialogResponse.back) {
                  context.go(AppRoute.mainMenuPageRouteName);
                } else if (value == MenuDialogResponse.reset) {
                  context.read<HomeBloc>().add(ResetEvent(score: 0));
                }
              }
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Home Page'),
            actions: const [],
            leading: IconButton(
              onPressed: () async {
                final result = await showExitPopup(context);
                if (result && context.mounted) {
                  context.go(AppRoute.mainMenuPageRouteName);
                }
              },
              icon: const Icon(Icons.arrow_back),
            ),
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
                            .read<HomeBloc>()
                            .add(ResetEvent(score: state.score));
                      } else {
                        context.read<HomeBloc>().add(ResetEvent(score: 0));
                      }
                    },
                    child: const Text(
                      'NEXT WORD',
                      style: TextStyle(
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

  String _convertGameStatus(HomeState state) {
    if (state.gameStatus == GameStatus.win) {
      return 'You Win';
    } else if (state.gameStatus == GameStatus.lose) {
      return 'You Lose';
    }
    return '';
  }
}
