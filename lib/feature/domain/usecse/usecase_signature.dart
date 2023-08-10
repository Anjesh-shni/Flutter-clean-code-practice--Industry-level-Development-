import 'package:dartz/dartz.dart';
import '../entity/app_error.dart';

//UseCase class for call method,
/*
We can create as many menthod as we want, just like below,
AppError responsible to showing error message
Either class are use to handle state like,
Error, Succes, left-> Error, Right-> Success
*/
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
