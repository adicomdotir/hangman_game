import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_game/commad.dart';
import 'package:hangman_game/result.dart';

List<User> dummyUsers = [
  User(id: 1, username: 'John'),
  User(id: 2, username: 'Aarron'),
  User(id: 3, username: 'Jack'),
  User(id: 4, username: 'Rose'),
  User(id: 5, username: 'Eli'),
];

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    load = Command0<List<User>>(_load)..execute();
    delete = Command1<bool, int>(_delete);
  }

  late final Command0<List<User>> load;
  late final Command1<bool, int> delete;

  Future<Result<List<User>>> _load() async {
    final rnd = Random();
    int rndValue = rnd.nextInt(5) + 1;

    await Future.delayed(const Duration(seconds: 3));

    if (rndValue % 2 == 0) {
      return Result.ok(dummyUsers);
    } else {
      return Result.error(Exception('unknown error'));
    }
  }

  Future<Result<bool>> _delete(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    dummyUsers.removeWhere((user) => user.id == id);
    notifyListeners();
    return const Result.ok(true);
  }
}

class User {
  User({
    required this.id,
    required this.username,
  });

  final int id;
  final String username;
}

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.addListener(_onViewModelChanged);
    viewModel.delete.addListener(
      () {
        if (viewModel.delete.completed) {
          viewModel.load.execute();
        }
      },
    );
  }

  @override
  void dispose() {
    viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  void _onViewModelChanged() {
    if (viewModel.delete.completed) {
      print('object');
    }

    viewModel.load.clearResult();
    // Show Snackbar
    print('show snackbar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListenableBuilder(
        listenable: viewModel.load,
        builder: (context, child) {
          if (viewModel.load.running) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (viewModel.load.error) {
            final error = (viewModel.load.result as Error<List<User>>).error;
            return SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    error.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.load.execute();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return child!;
        },
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            print('ViewModel Listen');

            final users = (viewModel.load.result as Ok<List<User>>).value;
            return SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return SizedBox(
                      height: 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Text(
                                  user.username.substring(0, 1).toUpperCase(),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                user.username,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          ListenableBuilder(
                            listenable: viewModel.delete,
                            builder: (context, child) {
                              if (viewModel.delete.running) {
                                return Text(
                                  'Deleting item',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.red),
                                );
                              }

                              return IconButton(
                                onPressed: () {
                                  viewModel.delete.execute(user.id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
