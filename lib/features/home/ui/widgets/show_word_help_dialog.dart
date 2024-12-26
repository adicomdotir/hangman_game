import 'package:flutter/material.dart';
import 'package:hangman_game/features/home/ui/blocs/home_bloc.dart';

enum WordHelpDialogResponse {
  wordType,
  wordMeaning,
  letter,
  cancel,
}

Future<WordHelpDialogResponse?> showWordHelpDialog(
  context,
  WordHelpState wordHelpState,
) async {
  return await showGeneralDialog<WordHelpDialogResponse>(
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
            'How can help you?',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        children: [
          const SizedBox(
            height: 32,
          ),
          TextButton(
            onPressed: !wordHelpState.showWordType
                ? () {
                    Navigator.pop(context, WordHelpDialogResponse.wordType);
                  }
                : null,
            child: const Text(
              'Word type (5 Point)',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          TextButton(
            onPressed: !wordHelpState.showMeaning
                ? () {
                    Navigator.pop(context, WordHelpDialogResponse.wordMeaning);
                  }
                : null,
            child: const Text(
              'Word meaning (15 Point)',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, WordHelpDialogResponse.letter);
            },
            child: const Text(
              'A letter (10 Point)',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, WordHelpDialogResponse.cancel);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
    },
  );
}
