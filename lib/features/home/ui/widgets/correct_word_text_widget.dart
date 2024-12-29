import 'package:flutter/material.dart';

class CorrectWordTextWidget extends StatefulWidget {
  const CorrectWordTextWidget({
    super.key,
    required this.word,
  });

  final String word;

  @override
  State<CorrectWordTextWidget> createState() => _CorrectWordTextWidgetState();
}

class _CorrectWordTextWidgetState extends State<CorrectWordTextWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward(); // Start the fade-in on initState.
  }

  @override
  void didUpdateWidget(covariant CorrectWordTextWidget oldWidget) {
    _controller.reset();
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Text(
        widget.word.toUpperCase(),
        style: const TextStyle(
          fontSize: 28,
          letterSpacing: 6,
        ),
      ),
    );
  }
}
