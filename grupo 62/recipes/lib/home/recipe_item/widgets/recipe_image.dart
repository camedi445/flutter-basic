import 'dart:ui';

import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  final String imageUrl;

  const RecipeImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(imageUrl),
        ),
        Positioned(
          right: 24.0,
          top: 24.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
