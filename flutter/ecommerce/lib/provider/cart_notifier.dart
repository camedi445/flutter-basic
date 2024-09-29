import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/domain/model/cart_item.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(CartItem item) {
    final List<CartItem> currentState = List.from(state);

    final existingItemIndex = currentState
        .indexWhere((cartItem) => cartItem.productId == item.productId);

    if (existingItemIndex != -1) {
      currentState[existingItemIndex] = CartItem(
        productId: currentState[existingItemIndex].productId,
        title: currentState[existingItemIndex].title,
        price: currentState[existingItemIndex].price,
        quantity: currentState[existingItemIndex].quantity + item.quantity,
      );
    } else {
      currentState.add(item);
    }
    state = currentState;
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
