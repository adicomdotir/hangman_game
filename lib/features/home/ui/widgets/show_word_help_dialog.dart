import 'package:flutter/material.dart';
import 'package:hangman_game/features/home/ui/blocs/home_bloc.dart';

enum WordHelpDialogResponse {
  wordType,
  wordMeaning,
  letter,
  cancel,
}

Future<WordHelpDialogResponse> showWordHelpDialog(
  context,
  WordHelpState wordHelpState,
) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SimpleDialog(
        title: const Center(
          child: Text(
            'How can help you?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
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
                fontWeight: FontWeight.w300,
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
                fontWeight: FontWeight.w300,
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
                fontWeight: FontWeight.w300,
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
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      );
    },
  );
}
