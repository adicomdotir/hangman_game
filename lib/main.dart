import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/core/bloc/word_list/word_list_bloc.dart';
import 'package:hangman_game/core/constants.dart';
import 'package:hangman_game/core/di/injectable.dart';
import 'package:hangman_game/core/router/route.dart';
import 'package:hangman_game/features/home/index.dart';
import 'package:hangman_game/features/login/index.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<WordListBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Guess Word',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF00897B),
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
