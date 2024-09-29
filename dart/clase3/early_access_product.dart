import 'discount_mixin.dart';
import 'product.dart';

class EarlyAccessProduct extends Product with DiscountMixin{
  EarlyAccessProduct({
    required String title,
    required double price,
    required int quantity,
  }) : 
  super(
            title: title,
            price: price,
            quantity: quantity,
            type: ProductType.earlyAccess);

  EarlyAccessProduct.fromJson(Map<String, dynamic> json)
      : super(
            title: json['title'] ?? 'titulo no definido',
            price: json['price'] ?? 0.0,
            quantity: json['quantity'] ?? 0,
            type: json['type'] ?? ProductType.earlyAccess);
}
