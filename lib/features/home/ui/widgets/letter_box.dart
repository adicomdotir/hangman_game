import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/home/ui/blocs/game_bloc.dart';

class LetterBox extends StatelessWidget {
  const LetterBox({
    super.key,
    required this.boxWidth,
    required this.model,
    required this.idx,
  });

  final double boxWidth;
  final KeyboardModel model;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          if (context.read<GameBloc>().state.gameStatus == GameStatus.normal &&
              model.isActive) {
            context
                .read<GameBloc>()
                .add(TapLetterEvent(letter: model.letter, letterIndex: idx));
          }
        },
        child: Container(
          color: model.isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.inversePrimary,
          width: boxWidth - 8,
          height: 64 - 8,
          child: Center(
            child: Text(
              model.letter.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
