import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'log_in_event.dart';
import 'log_in_state.dart';


class SignInBloc extends Bloc<AuthenticEvent, AuthenticState> {
  SignInBloc() : super(AuthenticState()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
      debugPrint(state.email);
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
      debugPrint(state.password);
    });
  }
}
