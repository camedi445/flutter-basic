import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/model/recipe.dart';
import 'package:recipes/ui/category_recipe_list/provider/recipe_notifier.dart';

final listOfRecipeProvider =
    StateNotifierProvider<RecipeNotifier, List<Recipe>>((ref) {
  return RecipeNotifier(listOfRecipe: []);
});
