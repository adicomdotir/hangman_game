import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/arch/routing/routes.dart';
import 'package:hangman_game/arch/ui/home/view_models/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required HomeViewModel viewModel, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push(Routes.users);
          },
          child: const Text('Users List'),
        ),
      ),
    );
  }
}
