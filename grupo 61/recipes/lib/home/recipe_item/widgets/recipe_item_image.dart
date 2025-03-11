import 'dart:ui';

import 'package:flutter/material.dart';

class RecipeItemImage extends StatelessWidget {
  final String imageUrl;
  final bool isFavourite;
  final VoidCallback onFavouriteTap;

  const RecipeItemImage({
    super.key,
    required this.imageUrl,
    required this.isFavourite,
    required this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFavouriteTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, right: 4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                fit: BoxFit.fill,
                imageUrl,
              ),
            ),
            Positioned(
              top: 28.0,
              right: 16.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_outline,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
