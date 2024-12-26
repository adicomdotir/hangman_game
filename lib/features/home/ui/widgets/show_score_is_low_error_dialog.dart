import 'package:flutter/material.dart';

Future<void> showScoreIsLowErrorDialog(
  context,
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
            'Warning',
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
              'Your score is low for this action'.toUpperCase(),
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
