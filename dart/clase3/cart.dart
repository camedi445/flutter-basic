import 'product.dart';

class Cart {

  final List<Product> _item = [];

  void addProduct(Product product) {
    product.removeStock(1);
    _item.add(product);
    print('${product.title} agregado al carrito');
  }

}
