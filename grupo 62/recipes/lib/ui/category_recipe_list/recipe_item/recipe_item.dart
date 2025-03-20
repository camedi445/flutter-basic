import 'package:flutter/material.dart';
import 'package:recipes/domain/model/recipe.dart';
import 'package:recipes/ui/category_recipe_list/recipe_item/widgets/avatar_info.dart';
import 'package:recipes/ui/category_recipe_list/recipe_item/widgets/recipe_category.dart';
import 'package:recipes/ui/category_recipe_list/recipe_item/widgets/recipe_image.dart';
import 'package:recipes/ui/category_recipe_list/recipe_item/widgets/recipe_name.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onFavoriteTap;

  const RecipeItem({
    super.key,
    required this.recipe,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarInfo(),
          RecipeImage(
            imageUrl: recipe.imageUrl,
            isFavorite: recipe.isFavorite,
            onFavoriteTap: onFavoriteTap,
          ),
          RecipeName(
            name: recipe.name,
          ),
          RecipeCategory(),
        ],
      ),
    );
  }
}
