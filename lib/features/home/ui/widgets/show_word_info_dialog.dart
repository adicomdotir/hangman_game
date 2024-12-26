import 'package:flutter/material.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';

Future<void> showWordInfoDialog(
  context,
  WordEntity word,
) async {
  return await showGeneralDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return SimpleDialog(
        title: const Center(
          child: Text(
            'Word',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        children: [
          const SizedBox(
            height: 32,
          ),
          Center(
            child: Text(
              word.word.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              word.wordTypeEntity.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              word.mean.replaceAll('[word]', word.word),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    },
  );
}
