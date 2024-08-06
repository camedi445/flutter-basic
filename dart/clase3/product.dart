import 'inventory_mixin.dart';

abstract class Product with InventoryMixin{
   
   String title;
   double price;
   int quantity = 0;
   final ProductType type;

   Product( {
    required this.title,
    required this.price,
    required this.quantity,
    required this.type
   }); 
 

   @override
   String toString() {
    return '$title ${price == 0 ? 'gratis' : 'c/u por un valor de \$$price'}';
   }
      
}


enum ProductType { standard, earlyAccess }
