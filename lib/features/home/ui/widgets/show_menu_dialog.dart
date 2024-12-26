import 'package:flutter/material.dart';

enum MenuDialogResponse {
  reset,
  back,
}

Future<MenuDialogResponse?> showMenuDialog(context) async {
  return await showGeneralDialog<MenuDialogResponse>(
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
            'You Lose!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        children: [
          const SizedBox(
            height: 64,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, MenuDialogResponse.reset);
            },
            child: const Text(
              'Play Again',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, MenuDialogResponse.back);
            },
            child: const Text(
              'Back to main menu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      );
    },
  );
}
