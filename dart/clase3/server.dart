import 'cart.dart';
import 'early_access_product.dart';
import 'product.dart';
import 'standard_product.dart';

void main() {
  final Cart cart = Cart();
  final Product oil =
      StandardProduct(title: 'Aceite 200ml', price: 15000.0, quantity: 2);

  final Map<String, dynamic> breadJson = {
    'title': 'Pan',
    'price': 2500.0,
    'quantity': 1,
  };

  final bread = EarlyAccessProduct.fromJson(breadJson);

  // Cargar inventario

  oil.addStock(2);
  bread.addStock(1);

  // aplicar un descuento
  bread.setDiscount(15.0);

  // Catalogo

  print(oil);
  print(bread);

  // Agregar al carrito
  cart.addProduct(oil);
  cart.addProduct(bread);

  // mostrar precios con descuento

  print('Precio a pagar de ${bread.title} : ${bread.calculateDiscountedPrice(bread.price)}');
}
