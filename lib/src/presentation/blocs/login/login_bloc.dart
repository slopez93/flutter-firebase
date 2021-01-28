import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hoverpayClean/src/application/usecases/authentication/sign_in.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  SignInUseCase signIn;

  LoginBloc({@required SignInUseCase signInUseCase}) : super(null) {
    this.signIn = signInUseCase;
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is DoLogin) {
      yield* _mapDoLoginToState(event.email, event.password);
    }
  }

  Stream<LoginState> _mapDoLoginToState(String email, String password) async* {
    try {
      final response = await signIn(email, password);
      print(response);
      yield LoginSuccess();
    } catch (e) {
      yield LoginFailure(e.message);
    }
  }
}
