import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_app/feature/presentation/bloc/on_boarding_bloc/welcome_event.dart';
import 'package:pos_app/feature/presentation/bloc/on_boarding_bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
   on<WelcomeEvent>((event,emit){
    emit(WelcomeState(pages: state.pages));
   });
  }
  
}