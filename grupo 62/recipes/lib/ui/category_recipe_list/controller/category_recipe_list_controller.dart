import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/data/service/recipe_service.dart';
import 'package:recipes/ui/category_recipe_list/controller/category_recipe_list_state.dart';

class CategoryRecipeListController
    extends StateNotifier<CategoryRecipeListState> {
  CategoryRecipeListController() : super(CategoryRecipeListState());
  final recipeService = RecipeService();

  Future<void> initialize() async {
    await getRecipeListByCategory('Chicken');
  }

  Future<void> getRecipeListByCategory(String categoyName) async {
    state = state.copyWith(isLoading: true);
    try {
      final listOfRecipe =
          await recipeService.fetchRecipeListByCategory(categoyName);
      state = state.copyWith(isLoading: false, listOfRecipe: listOfRecipe);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}
