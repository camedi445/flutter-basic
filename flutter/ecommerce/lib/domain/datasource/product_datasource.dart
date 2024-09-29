import '../model/product.dart';

abstract class ProductDataSource {
  Future<List<Product>> fetchProducts();
  Future<Product> fetchProductById(int id);
}
