import 'package:flutter/material.dart';
import 'package:hangman_game/features/home/index.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({
    required this.practiceMode,
    super.key,
  });

  final bool practiceMode;

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width / 8;

    return Column(
      children: [
        KeyboardRow(
          boxWidth: boxWidth,
          indexes: const [0, 1, 2, 3, 4, 5, 6],
          practiceMode: practiceMode,
        ),
        const SizedBox(
          height: 12,
        ),
        KeyboardRow(
          boxWidth: boxWidth,
          indexes: const [7, 8, 9, 10, 11, 12, 13],
          practiceMode: practiceMode,
        ),
        const SizedBox(
          height: 12,
        ),
        KeyboardRow(
          boxWidth: boxWidth,
          indexes: const [14, 15, 16, 17, 18, 19, 20],
          practiceMode: practiceMode,
        ),
        const SizedBox(
          height: 12,
        ),
        KeyboardRow(
          boxWidth: boxWidth,
          indexes: const [21, 22, 23, 24, 25, 26, 27],
          practiceMode: practiceMode,
        ),
      ],
    );
  }
}
