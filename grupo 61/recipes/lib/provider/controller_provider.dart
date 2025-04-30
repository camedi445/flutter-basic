import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/controller/recipe_list_by_category_controller.dart';
import 'package:recipes/controller/recipe_list_by_category_state.dart';
import 'package:recipes/provider/repository_provider.dart';

final recipeListByCategoryControllerProvider = StateNotifierProvider<
    RecipeListByCategoryController, RecipeListByCategoryState>((ref) {
  final recipeRepository = ref.watch(recipeApiRepositoryProvider);
  final recipeListByCategoryController =
      RecipeListByCategoryController(recipeRepository);
  recipeListByCategoryController.initialize();
  return recipeListByCategoryController;
});
