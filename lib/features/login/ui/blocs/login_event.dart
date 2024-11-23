part of 'login_bloc.dart';

abstract class LoginEvent {}

class SubmitLoginEvent extends LoginEvent {
  SubmitLoginEvent({required this.email, required this.password});

  final String email;
  final String password;
}
