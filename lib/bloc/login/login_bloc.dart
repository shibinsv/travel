import 'package:bloc/bloc.dart';
import 'package:initial_test/utils/constants.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChanged>((event, emit) => {
          emit(LoginFunctions.isInputsValid(event.number, event.password)
              ? LoginValidState()
              : LoginErrorState(LoginFunctions.numberValidation(event.number),
                  LoginFunctions.passwordValidation(event.password)))
        });
    on<LoginSubmittedEvent>((event, emit) => {emit(LoginSubmittedState())});

    on<LoginLoadingEvent>((event, emit) {
      emit(LoginLoadingState());
    });
  }
}
