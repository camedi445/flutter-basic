import 'package:ecommerce/presentation/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce/provider/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    return SafeArea(
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ShoppingCartItem(cartItem: cartItems[index]);
        },
      ),
    );
  }
}
