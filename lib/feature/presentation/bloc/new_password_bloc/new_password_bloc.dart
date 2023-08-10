import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_app/feature/presentation/bloc/new_password_bloc/new_password_state.dart';

class NewPasswordBloc extends Cubit<NewPassword> {
  NewPasswordBloc() : super(InitialState());
}
