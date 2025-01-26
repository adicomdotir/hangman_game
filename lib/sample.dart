import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(
      Theme.of(context).textTheme.bodyMedium,
    );
    return MaterialApp(
      title: 'Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00897B),
        ),
        textTheme: TextTheme(
          bodyMedium: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.red),
        ).apply(),
        useMaterial3: true,
        fontFamily: 'CustomFont',
      ),
      debugShowCheckedModeBanner: false,
      home: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'bodyLarge ${Theme.of(context).textTheme.bodyLarge?.fontSize}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Text(
              'bodyMedium 14',
            ),
            Text(
              'bodyMedium ${Theme.of(context).textTheme.bodyMedium?.fontSize}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'bodySmall ${Theme.of(context).textTheme.bodySmall?.fontSize}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'displayLarge ${Theme.of(context).textTheme.displayLarge?.fontSize}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'displayMedium ${Theme.of(context).textTheme.displayMedium?.fontSize}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'displaySmall ${Theme.of(context).textTheme.displaySmall?.fontSize}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'headlineLarge ${Theme.of(context).textTheme.headlineLarge?.fontSize}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'headlineMedium ${Theme.of(context).textTheme.headlineMedium?.fontSize}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'headlineSmall ${Theme.of(context).textTheme.headlineSmall?.fontSize}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Text(
              'labelLarge 14',
            ),
            Text(
              'labelLarge ${Theme.of(context).textTheme.labelLarge?.fontSize}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              'labelMedium ${Theme.of(context).textTheme.labelMedium?.fontSize}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'labelSmall ${Theme.of(context).textTheme.labelSmall?.fontSize}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              'titleLarge ${Theme.of(context).textTheme.titleLarge?.fontSize}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'titleMedium ${Theme.of(context).textTheme.titleMedium?.fontSize}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text(
              'titleSmall 14',
            ),
            Text(
              'titleSmall ${Theme.of(context).textTheme.titleSmall?.fontSize}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
