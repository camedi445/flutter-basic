import 'package:ecommerce/domain/model/cart_item.dart';
import 'package:ecommerce/presentation/product/widgets/product_quantity.dart';
import 'package:ecommerce/provider/cart_notifier.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingCartItem extends ConsumerStatefulWidget {
  final CartItem cartItem;
  const ShoppingCartItem({super.key, required this.cartItem});

  @override
  ConsumerState<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends ConsumerState<ShoppingCartItem> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.cartItem.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Card(
        color: Colors.grey.shade900,
        child: SizedBox(
          width: double.infinity,
          height: 120,
          child: Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Image.network(
                width: 76,
                height: 76,
                widget.cartItem.image,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 86,
                    child: Text(
                      widget.cartItem.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              ProductQuantity(
                initialQuantity: _quantity,
                onQuantityChange: (quantity) {
                  setState(() {
                    _quantity = quantity;
                    ref.read(cartProvider.notifier).updateItemQuantityById(
                          widget.cartItem.productId,
                          _quantity,
                        );
                  });
                },
              ),
              Text(
                "\$${(widget.cartItem.price * _quantity).toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.buttonColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
