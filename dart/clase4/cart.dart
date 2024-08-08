import 'product.dart';

class Cart {
  final List<Product> _items = [];

  void addProduct(Product product) {
     product.removeStock(1);
    _items.add(product);
    print('${product.title} agregado al carrito');
  }

  List<Product> get items => _items;

  double getTotalPrice() {
    return _items.fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }
}
