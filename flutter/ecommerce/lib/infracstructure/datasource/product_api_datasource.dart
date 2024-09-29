import 'package:http/http.dart' as http;
import 'package:ecommerce/domain/datasource/product_datasource.dart';
import 'package:ecommerce/domain/model/product.dart';
import 'dart:convert';

class ProductApiDatasource extends ProductDataSource {
  static const String _baseUrl = 'https://fakestoreapi.com';

  @override
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      final List<Product> products = (json.decode(response.body) as List)
          .map((productJson) => Product.fromJson(productJson))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<Product> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product with id: $id');
    }
  }
}
