import 'package:dartz/dartz.dart';
import 'package:pos_app/feature/domain/usecse/usecase_signature.dart';
import '../entity/app_error.dart';
import '../entity/no_params.dart';
import '../entity/product_entity.dart';
import '../repositories/product_repository.dart';

//This is call method for getting category list.
class GetCategory extends UseCase<List<ProductEntity>, NoParams> {
  final ProductsRepository productsRepository;

  GetCategory(this.productsRepository);

  @override
  Future<Either<AppError, List<ProductEntity>>> call(NoParams noParams) async {
    return await productsRepository.getProducts();
  }
}
