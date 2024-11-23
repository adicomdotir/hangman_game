import 'package:flutter/material.dart';
import 'package:hangman_game/data_source.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List<Map<String, dynamic>> topScores = [];

  @override
  void initState() {
    super.initState();
    fetchTopScores().then(
      (value) {
        topScores = value;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: topScores.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(topScores[index]['user_email']),
                Text(topScores[index]['score'].toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
