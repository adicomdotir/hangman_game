part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucces extends LoginState {}

class LoginError extends LoginState {
  LoginError({required this.msg});

  final String msg;
}
