import 'package:pos_app/feature/data/model/product_result_model.dart';
import '../core/api_client.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<Products>> getProducts();
  Future<List<Products>> getCategory();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final ApiClient _client;

  ProductRemoteDataSourceImpl(this._client);

  //Getting product list
  @override
  Future<List<Products>> getProducts() async {
    final response = await _client.get("URL FOR PRODUCTS");
    final List<Products>? products =
        ProductResultModel.fromJson(response).products;
    return products!;
  }

  //Getting category list
  @override
  Future<List<Products>> getCategory() async {
    final response = await _client.get("URL FOR Category");
    final List<Products>? category =
        ProductResultModel.fromJson(response).products;
    return category!;
  }
}
