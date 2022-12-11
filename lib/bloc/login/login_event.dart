part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginLoadingEvent extends LoginEvent{}

class LoginTextChanged extends LoginEvent {
  final String number;
  final String password;
  LoginTextChanged(this.number, this.password);
}

class LoginSubmittedEvent extends LoginEvent {}
