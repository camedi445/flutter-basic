import 'product.dart';
import 'product_type.dart';

class StandardProduct extends Product {
  StandardProduct({
    required String title,
    required String description,
    required double price,
    required String image,
    required int quantity,
  })  : assert(price >= 0.0, 'el precio debe ser mayor o igual a cero'),
        assert(quantity >= 0, 'la cantidad debe ser mayor o igual a cero'),
        super(
            title: title,
            description: description,
            price: price,
            image: image,
            quantity: quantity,
            type: ProductType.standard);

  StandardProduct.fromJson(Map<String, dynamic> json)
      : super(
            title: json['title'] ?? 'titulo no definido',
            description: json['description'] ?? 'descripcion no definida',
            price: json['price'] ?? 0.0,
            image: json['image'] ?? 'image por defecto',
            quantity: json['quantity'] ?? 0,
            type: ProductType.standard);
}
