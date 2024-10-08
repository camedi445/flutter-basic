import 'package:ecommerce/domain/model/cart_item.dart';
import 'package:ecommerce/domain/model/product.dart';
import 'package:ecommerce/presentation/product/widgets/product_quantity.dart';
import 'package:ecommerce/provider/cart_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/utils/colors.dart';

class ProductDetailQuantity extends ConsumerStatefulWidget {
  final Product product;
  const ProductDetailQuantity({super.key, required this.product});

  @override
  ConsumerState<ProductDetailQuantity> createState() =>
      _ProductDetailQuantityState();
}

class _ProductDetailQuantityState extends ConsumerState<ProductDetailQuantity> {
  int _quantity = 1;
  String _buttonText = 'Añadir al carrito';

  @override
  void initState() {
    super.initState();
    final intialQuantity =
        ref.read(cartProvider.notifier).getProductQuantity(widget.product.id);
    if (intialQuantity > 1) {
      setState(() {
        _buttonText = 'Actualizar';
        _quantity = intialQuantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.read(cartProvider.notifier);

    return Row(
      children: [
        ProductQuantity(
          initialQuantity: _quantity,
          onQuantityChange: (quantity) {
            setState(() {
              _quantity = quantity;
            });
          },
        ),
        Expanded(
          child: CupertinoButton(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _buttonText,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            onPressed: () {
              setState(() {
                if (cartNotifier.isItemInCart(widget.product.id)) {
                  cartNotifier.updateItemQuantityById(
                    widget.product.id,
                    _quantity,
                  );
                  _showSnackbar('Producto actualizado');
                } else {
                  cartNotifier.addItem(
                    CartItem(
                      image: widget.product.image,
                      productId: widget.product.id,
                      title: widget.product.title,
                      price: widget.product.price,
                      quantity: _quantity,
                    ),
                  );
                  _showSnackbar('Producto añadido al carrito');
                }

                Navigator.pop(context);
              });
            },
          ),
        ),
        const SizedBox(
          height: 24.0,
        )
      ],
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
