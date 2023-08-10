import 'package:pos_app/feature/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import '../entity/app_error.dart';

/*
We can create as many menthod as we want, just like below,
AppError responsible to showing error message
Either class are use to handle state like,
Error, Succes, left-> Error, Right-> Success
*/
abstract class ProductsRepository {
  Future<Either<AppError, List<ProductEntity>>> getProducts();
  Future<Either<AppError, List<ProductEntity>>> getCategory();
}
