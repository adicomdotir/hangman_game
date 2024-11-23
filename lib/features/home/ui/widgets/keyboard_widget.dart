import 'package:flutter/material.dart';
import 'package:hangman_game/features/home/ui/widgets/keyboard_row.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width / 10;

    return Column(
      children: [
        KeyboardRow(
          boxWidth: boxWidth,
          indexes: const [0, 1, 2, 3, 4, 5, 6, 7, 8],
        ),
        KeyboardRow(
          boxWidth: boxWidth,
          indexes: const [9, 10, 11, 12, 13, 14, 15, 16, 17],
        ),
        KeyboardRow(
          boxWidth: boxWidth,
          indexes: const [18, 19, 20, 21, 22, 23, 24, 25],
        ),
      ],
    );
  }
}
