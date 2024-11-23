import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/router/route.dart';
import 'package:hangman_game/features/login/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSucces) {
          context.go(AppRoute.homePageRouteName);
        }
        if (state is LoginError) {
          final snackBar = SnackBar(
            content: Text(state.msg),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                (state is LoginLoading)
                    ? _submitButtonBuild(
                        context: context,
                        title: 'Loading',
                        onTap: null,
                      )
                    : _submitButtonBuild(
                        context: context,
                        title: 'Login',
                        onTap: () async {
                          String email = _emailCtrl.text;
                          String password = _passwordCtrl.text;
                          context.read<LoginBloc>().add(
                                SubmitLoginEvent(
                                  email: email,
                                  password: password,
                                ),
                              );
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  ElevatedButton _submitButtonBuild({
    required BuildContext context,
    required String title,
    required Function()? onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title),
    );
  }
}
