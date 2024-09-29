import 'package:flutter/material.dart';

class ProductDetailImage extends StatelessWidget {
  final String imageUrl;

  const ProductDetailImage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.contain,
      width: double.infinity,
      height: 180,
    );
  }
}
