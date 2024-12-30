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
          context.go(AppRoute.mainMenuPageRouteName);
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
          backgroundColor: const Color(0xFFF8F8F8), // Light gray background
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login Page',
                    style: TextStyle(
                      fontSize: 30.0,
                      color:
                          Color(0xFFB0BEC5), // Slightly darker background shade
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  TextField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: UnderlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30.0),
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
          ),
        );
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
          ),
          body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
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
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9E768F), // Soft purple
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
