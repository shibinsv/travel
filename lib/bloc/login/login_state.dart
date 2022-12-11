part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginSubmittedState extends LoginState {}

class LoginErrorState extends LoginState {
  final String numberError;
  final String passwordError;

  LoginErrorState(this.numberError, this.passwordError);
}
