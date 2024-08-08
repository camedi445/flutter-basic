import 'dart:convert';

import 'product.dart';
import 'product_list_mock.dart';

class ProductDatasource {
  Future<List<Product>> fetchProductList() async {
    // simular un tiempo de espera de 3 segundos
    await Future.delayed(Duration(seconds: 3));

    // convertir los datos .json a un mapa
    final decodedJson = jsonDecode(productListJson);

    // convertir el mapa en el modelo de negocio

    final List<Product> productlist = [];

    decodedJson.forEach((json) {
      productlist.add(Product.fromJson(json));
    });

    return productlist;
  }

  Stream<Product> getProductStream() async* {
    // Simular un retraso de 2 segundos
    await Future.delayed(Duration(seconds: 2));

    // Decodificar el JSON a una List<dynamic>
    List<dynamic> decodedJson = jsonDecode(productListJson);

    // Iterar sobre cada elemento de la lista decodificada y emitirlo como un Product
    for (final item in decodedJson) {
        // esperar dos segundos para cada producto
        await Future.delayed(Duration(seconds: 2));
        // emitir el producto
        print('Nuevo producto disponible');
        yield Product.fromJson(item);
    }
  }
}
