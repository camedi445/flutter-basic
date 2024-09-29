import 'package:ecommerce/domain/datasource/product_datasource.dart';
import 'package:ecommerce/domain/model/product.dart';

class ProductRepository {
  final ProductDataSource dataSource;

  ProductRepository(this.dataSource);

  Future<List<Product>> getProducts() {
    return dataSource.fetchProducts();
  }

  Future<Product> getProductById(int id) {
    return dataSource.fetchProductById(id);
  }
}
