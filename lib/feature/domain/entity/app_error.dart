import 'package:equatable/equatable.dart';

//Error class responsible for showing error message
class AppError extends Equatable{
  final String message;

  const AppError(this.message);
  
  @override
  List<Object?> get props =>[message];
}