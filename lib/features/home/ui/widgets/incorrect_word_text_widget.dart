import 'package:flutter/material.dart';

class IncorrectWordTextWidget extends StatefulWidget {
  const IncorrectWordTextWidget({
    required this.word,
    super.key,
  });

  final String word;

  @override
  State<IncorrectWordTextWidget> createState() =>
      _IncorrectWordTextWidgetState();
}

class _IncorrectWordTextWidgetState extends State<IncorrectWordTextWidget>
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
  void didUpdateWidget(covariant IncorrectWordTextWidget oldWidget) {
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
          color: Colors.red,
        ),
      ),
    );
  }
}
