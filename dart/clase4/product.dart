import 'early_access_product.dart';
import 'inventory_mixin.dart';
import 'product_type.dart';
import 'standard_product.dart';

abstract class Product with InventoryMixin{
  String title;
  String description;
  double price;
  String image;
  int quantity = 0;
  final ProductType type;

  Product(
      {required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.quantity,
      required this.type});

  @override
  String toString() {
    return '$title ${price == 0 ? 'gratis' : 'c/u por un valor de : \$$price'}';
  }

 factory Product.fromJson(Map<String, dynamic> json) {
    ProductType type = productTypeFromString(json['type']);
    switch (type) {
      case ProductType.earlyAccess:
        return EarlyAccessProduct.fromJson(json);
      case ProductType.standard:
        return StandardProduct.fromJson(json);
      default:
        throw ArgumentError('Tipo de producto no reconocido: ${json['type']}');
    }
  }
}