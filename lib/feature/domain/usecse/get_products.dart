import 'package:dartz/dartz.dart';
import 'package:pos_app/feature/domain/entity/no_params.dart';
import 'package:pos_app/feature/domain/entity/product_entity.dart';
import 'package:pos_app/feature/domain/repositories/product_repository.dart';
import 'package:pos_app/feature/domain/usecse/usecase_signature.dart';
import '../entity/app_error.dart';

//This is call method for getting products list.
class GetProducts extends UseCase<List<ProductEntity>,NoParams>{
  final ProductsRepository productsRepository;

  GetProducts(this.productsRepository);
  
  @override
  Future<Either<AppError, List<ProductEntity>>> call(NoParams noParams) async {
    return await productsRepository.getProducts();
  }
}
