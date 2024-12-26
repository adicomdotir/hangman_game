import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/leaderboard/index.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LeaderboardBloc>(context).add(LeaderboardEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(fontSize: 28),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          if (state is LeaderboardLoaded) {
            if (state.data.isEmpty) {
              return const Center(
                child: Text('No Data'),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Text(
                              '#',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'High Score / Last Score',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final player = state.data[index - 1];
                  final isCurrentUser = player.userEmail ==
                      'user1@example.com'; //Replace with current user id

                  return Card(
                    color: isCurrentUser
                        ? Colors.blueGrey[100] // Highlight current user
                        : null,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            '$index.',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            player.userEmail.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${player.score.toString()}/${player.lastScore.toString()}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is LeaderboardError) {
            return Center(child: Text('error'.toUpperCase()));
          } else if (state is LeaderboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Placeholder();
        },
      ),
    );
  }
}
