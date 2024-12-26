import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/di/injectable.dart';
import 'package:hangman_game/core/router/route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _controller.forward().whenComplete(() {
      Future.wait([
        Future.value(getIt<Supabase>().client.auth.currentSession),
        Future.delayed(
          const Duration(milliseconds: 2000),
        ),
      ]).then((responseList) {
        final session = responseList.first as Session?;

        if (mounted) {
          String route = session != null
              ? AppRoute.mainMenuPageRouteName
              : AppRoute.loginPageRouteName;
          context.go(route);
        }
      }).catchError((_) {
        if (mounted) {
          context.go(AppRoute.loginPageRouteName);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 220),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace with your actual logo
              Icon(Icons.abc_sharp, size: 100, color: Colors.orangeAccent),
              SizedBox(height: 16),
              Text(
                'Guess Word',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              CircularProgressIndicator(color: Colors.orangeAccent),
            ],
          ),
        ),
      ),
    );
  }
}
