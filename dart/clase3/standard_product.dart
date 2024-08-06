import 'product.dart';

class StandardProduct extends Product {
  StandardProduct({
    required String title,
    required double price,
    required int quantity,
  }) : 
    super(
            title: title,
            price: price,
            quantity: quantity,
            type: ProductType.standard);

  StandardProduct.fromJson(Map<String, dynamic> json)
      : super(
            title: json['title'] ?? 'titulo no definido',
            price: json['price'] ?? 0.0,
            quantity: json['quantity'] ?? 0,
            type: json['type'] ?? ProductType.standard);
}
