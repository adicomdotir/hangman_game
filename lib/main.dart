import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/core/constants.dart';
import 'package:hangman_game/core/di/injectable.dart';
import 'package:hangman_game/core/router/route.dart';
import 'package:hangman_game/features/home/ui/blocs/game_bloc.dart';
import 'package:hangman_game/features/login/index.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// It's handy to then extract the Supabase client in a variable for later uses
final supabase = Supabase.instance.client;

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
          create: (context) => GameBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Guess Word',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'RobotoMono',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
