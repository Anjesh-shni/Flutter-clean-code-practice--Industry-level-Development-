import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_app/feature/presentation/bloc/signIn_bloc/sign_up_event.dart';
import 'package:pos_app/feature/presentation/bloc/signIn_bloc/sign_up_state.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<UserNameEvent>(
      (event, emit) {
        emit(state.copyWith(userName: event.username));
        debugPrint(state.userName);
      },
    );
    on<EmailEvent>(
      (event, emit) {
        emit(state.copyWith(email: event.email));
        debugPrint(state.email);
      },
    );
    on<PasswordEvent>(
      (event, emit) {
        emit(state.copyWith(password: event.password));
        debugPrint(state.password);
      },
    );
    on<RetypePasswordEvent>(
      (event, emit) {
        emit(state.copyWith(reTypePassword: event.reTypePassword));
        debugPrint(state.reTypePassword);
      },
    );
  }
}
