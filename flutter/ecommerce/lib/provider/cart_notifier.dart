import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/domain/model/cart_item.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    state = [...state, item];
  }

  void removeItem(int id) {
    state = state.where((item) => item.productId != id).toList();
  }

  void updateItemQuantityById(int id, int newQuantity) {
    state = state.map((item) {
      return item.productId == id ? item.copyWith(quantity: newQuantity) : item;
    }).toList();
  }

  int getProductQuantity(int id) {
    final item = state.firstWhere(
      (item) => item.productId == id,
      orElse: () => CartItem(
          productId: id, title: '', price: 0.0, image: '', quantity: 1),
    );
    return item.quantity;
  }

  bool isItemInCart(int id) {
    return state.any((item) => item.productId == id);
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
