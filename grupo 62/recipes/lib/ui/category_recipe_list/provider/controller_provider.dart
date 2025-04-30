import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/model/recipe.dart';
import 'package:recipes/ui/category_recipe_list/controller/category_recipe_list_controller.dart';
import 'package:recipes/ui/category_recipe_list/controller/category_recipe_list_state.dart';
import 'package:recipes/ui/category_recipe_list/controller/favorite_recipe_list_controller.dart';

final categoryRecipeListControllerProvider = StateNotifierProvider<
    CategoryRecipeListController, CategoryRecipeListState>((ref) {
  final CategoryRecipeListController categoryRecipeListController =
      CategoryRecipeListController();
  categoryRecipeListController.initialize();
  return categoryRecipeListController;
});

final favoriteRecipeListControllerProvider =
    StateNotifierProvider<FavoriteRecipeListController, List<Recipe>>((ref) {
  return FavoriteRecipeListController();
});
