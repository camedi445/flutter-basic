import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/domain/model/product.dart';
import 'package:ecommerce/utils/colors.dart';

class ProductDetailQuantity extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailQuantity(this.product, {super.key});

  @override
  ConsumerState<ProductDetailQuantity> createState() =>
      _ProductDetailQuantityState();
}

class _ProductDetailQuantityState extends ConsumerState<ProductDetailQuantity> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
              onPressed: () {
                if (_quantity > 1) {
                  setState(() {
                    _quantity--;
                  });
                }
              },
            ),
            Text(_quantity.toString(),
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _quantity++;
                });
              },
            ),
          ],
        ),
        Expanded(
          child: CupertinoButton(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(30)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Añadir al carrito',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              onPressed: () {}),
        ),
        const SizedBox(
          height: 24.0,
        )
      ],
    );
  }
}
