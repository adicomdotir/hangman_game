import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/home/ui/blocs/home_bloc.dart';
import 'package:hangman_game/features/home/ui/widgets/letter_box.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({
    super.key,
    required this.boxWidth,
    required this.indexes,
  });

  final double boxWidth;
  final List<int> indexes;

  @override
  Widget build(BuildContext context) {
    final keyModels = context.read<HomeBloc>().state.keyModels;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
