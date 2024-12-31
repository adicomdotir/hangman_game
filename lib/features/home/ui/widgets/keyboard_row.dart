import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/home/index.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({
    required this.boxWidth,
    required this.indexes,
    super.key,
  });

  final double boxWidth;
  final List<int> indexes;

  @override
  Widget build(BuildContext context) {
    final keyModels = context.read<HomeBloc>().state.keyModels;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...indexes.map((idx) {
          return LetterBox(
            boxWidth: boxWidth,
            model: keyModels[idx],
            idx: idx,
          );
        }),
      ],
    );
  }
}
