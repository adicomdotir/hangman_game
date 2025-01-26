import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/home/index.dart';

class LetterBox extends StatelessWidget {
  const LetterBox({
    required this.boxWidth,
    required this.model,
    required this.idx,
    required this.practiceMode,
    super.key,
  });

  final double boxWidth;
  final KeyboardModel model;
  final int idx;
  final bool practiceMode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context.read<HomeBloc>().state.gameStatus == GameStatus.normal &&
            model.isActive) {
          context.read<HomeBloc>().add(
                TapLetterEvent(
                  letter: model.letter,
                  letterIndex: idx,
                  practiceMode: practiceMode,
                ),
              );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: model.isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.inversePrimary,
        ),
        width: boxWidth - 4,
        height: 64 - 4,
        child: Center(
          child: Text(
            model.letter.toUpperCase(),
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
