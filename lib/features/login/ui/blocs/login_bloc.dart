import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/features/login/index.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.submitLoginUsecase}) : super(LoginInitial()) {
    on<SubmitLoginEvent>(_submitLoginEvent);
  }

  final SubmitLoginUsecase submitLoginUsecase;

  FutureOr _submitLoginEvent(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    if (event.email.isEmpty || event.password.isEmpty) {
      emit(LoginError(msg: 'Please enter email & password!'));
      return;
    } else {
      if (!_isEmail(event.email)) {
        emit(LoginError(msg: 'Please enter valid email!'));
        return;
      }
    }

    final result = await submitLoginUsecase(event.email, event.password);
    result.fold(
      (error) {
        emit(LoginError(msg: 'Server Error'));
      },
      (succes) {
        emit(LoginSucces());
      },
    );
  }

  bool _isEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(email);
  }
}
