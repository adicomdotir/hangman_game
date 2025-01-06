import 'package:flutter/material.dart';
import 'package:hangman_game/arch/ui/users/view_models/users_viewmodel.dart';
import 'package:hangman_game/arch/utils/result.dart';

import '../../../domain/models/user/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({required this.viewModel, super.key});

  final UsersViewModel viewModel;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
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
        title: const Text('Users Page'),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: widget.viewModel.loadUsers,
          builder: (context, child) {
            if (widget.viewModel.loadUsers.running) {
              return const CircularProgressIndicator();
            }

            if (widget.viewModel.loadUsers.error) {
              return Text(widget.viewModel.loadUsers.result.toString());
            }

            final users =
                (widget.viewModel.loadUsers.result as Ok<List<User>>).value;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: InkWell(
                    onTap: () {
                      print(user);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.id,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '${user.firstName} ${user.lastName}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
