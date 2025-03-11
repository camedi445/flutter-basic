import 'package:flutter/material.dart';
import 'package:recipes/home/recipe_item/widgets/avatar_info.dart';
import 'package:recipes/home/recipe_item/widgets/recipe_category.dart';
import 'package:recipes/home/recipe_item/widgets/recipe_image.dart';
import 'package:recipes/home/recipe_item/widgets/recipe_name.dart';

class RecipeItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const RecipeItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarInfo(),
          RecipeImage(
            imageUrl: imageUrl,
          ),
          RecipeName(
            name: name,
          ),
          RecipeCategory(),
        ],
      ),
    );
  }
}
