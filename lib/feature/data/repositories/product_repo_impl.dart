import 'package:dartz/dartz.dart';
import 'package:pos_app/feature/data/data_source/product_remote_data_source.dart';
import 'package:pos_app/feature/data/model/product_model.dart';
import 'package:pos_app/feature/domain/entity/app_error.dart';
import 'package:pos_app/feature/domain/repositories/product_repository.dart';

/*
This implementation reposity for product, category,
**Dependebility on ------------> Dependency

ApiClient---------------------->Client,
ProductRemoteDataSource-------->ApiClient,
ProducutRepository------------->ProductRemoteDataSource,
getProducts--------------------->ProducutRepository

*/
class ProductRepositoryImpl extends ProductsRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<Either<AppError, List<Products>>> getProducts() async {
    try {
      final product = await _productRemoteDataSource.getProducts();
      return Right(product);
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<Products>>> getCategory() async {
    try {
      final category = await _productRemoteDataSource.getCategory();
      return Right(category);
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }
}
