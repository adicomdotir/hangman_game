import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/route/route.dart';
import 'package:hangman_game/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      Future.value(supabase.auth.currentSession),
      Future.delayed(
        const Duration(milliseconds: 2000),
      ),
    ]).then((responseList) {
      final session = responseList.first as Session?;

      if (mounted) {
        String route = session != null
            ? AppRoute.homePageRouteName
            : AppRoute.loginPageRouteName;
        context.go(route);
      }
    }).catchError((_) {
      if (mounted) {
        context.go(AppRoute.loginPageRouteName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: const Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
