import 'package:flutter/material.dart';

class ProductQuantity extends StatefulWidget {
  final int initialQuantity;

  final ValueChanged<int> onQuantityChange;

  const ProductQuantity(
      {super.key,
      required this.onQuantityChange,
      required this.initialQuantity});

  @override
  State<ProductQuantity> createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

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
                    widget.onQuantityChange.call(_quantity);
                  });
                }
              },
            ),
            Text(_quantity.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.white)),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _quantity++;
                  widget.onQuantityChange.call(_quantity);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
