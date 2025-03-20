import 'package:flutter/material.dart';
import 'package:recipes/domain/model/recipe.dart';
import 'package:recipes/ui/recipe_list_by_category/recipe_item/widgets/avatar_info.dart';
import 'package:recipes/ui/recipe_list_by_category/recipe_item/widgets/recipe_item_category.dart';
import 'package:recipes/ui/recipe_list_by_category/recipe_item/widgets/recipe_item_image.dart';
import 'package:recipes/ui/recipe_list_by_category/recipe_item/widgets/recipe_item_name.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onFavouriteTap;

  const RecipeItem({
    super.key,
    required this.recipe,
    required this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarInfo(),
          RecipeItemImage(
              imageUrl: recipe.imageUrl,
              isFavourite: recipe.isFavorite,
              onFavouriteTap: onFavouriteTap),
          RecipeItemName(name: recipe.name),
          RecipeItemCategory(),
        ],
      ),
    );
  }
}
