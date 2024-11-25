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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Leaderboard'),
      ),
      body: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          if (state is LeaderboardLoaded) {
            if (state.data.isEmpty) {
              return const Center(
                child: Text('No Data'),
              );
            }
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.data[index].userEmail),
                      Text(state.data[index].score.toString()),
                    ],
                  ),
                );
              },
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
