import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pos_app/feature/data/data_source/product_remote_data_source.dart';
import 'package:pos_app/feature/data/repositories/product_repo_impl.dart';
import 'package:pos_app/feature/domain/repositories/product_repository.dart';
import 'package:pos_app/feature/domain/usecse/get_category.dart';
import 'package:pos_app/feature/domain/usecse/get_products.dart';

import '../../feature/data/core/api_client.dart';

/*
This Get_it package allow us to access 
any Bloc almost anywhere,
just by calling get-it instance.

**Dependency Injection
*/

final getItInstance = GetIt.I;

Future init() async {
  debugPrint("=======DataSource Initialized=======");

  //Client Will get initialized at first place when app started
  getItInstance.registerLazySingleton<Client>(() => Client());

  //Api Client register
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //Data source
  getItInstance.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(getItInstance()));

  //Product Repository
  getItInstance.registerLazySingleton<ProductsRepository>(
      () => ProductRepositoryImpl(getItInstance()));

  //Product
  getItInstance
      .registerLazySingleton<GetProducts>(() => GetProducts(getItInstance()));

  //Category
  getItInstance
      .registerLazySingleton<GetCategory>(() => GetCategory(getItInstance()));
}
