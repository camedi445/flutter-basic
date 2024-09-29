import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/domain/model/product.dart';
import 'package:ecommerce/infracstructure/datasource/product_api_datasource.dart';
import 'package:ecommerce/infracstructure/repository/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final dataSource = ProductApiDatasource();
  final repository = ProductRepository(dataSource);
  return repository;
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final productService = ref.watch(productRepositoryProvider);
  return await productService.getProducts();
});

final productProvider = FutureProvider.family<Product, int>((ref, id) async {
  final productService = ref.watch(productRepositoryProvider);
  return await productService.getProductById(id);
});
