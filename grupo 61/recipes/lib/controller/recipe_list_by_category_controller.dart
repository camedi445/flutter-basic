import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/controller/recipe_list_by_category_state.dart';
import 'package:recipes/data/repository/recipe_repository.dart';

class RecipeListByCategoryController
    extends StateNotifier<RecipeListByCategoryState> {
  final RecipeRepository recipeRepository;
  RecipeListByCategoryController(this.recipeRepository)
      : super(RecipeListByCategoryState());

  Future<void> initialize() async {
    await getRecipeListByCategory('Chicken');
  }

  Future<void> getRecipeListByCategory(String categoryName) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final listOfRecipe =
          await recipeRepository.getRecipeListByCategory(categoryName);
      state = state.copyWith(
          isLoading: false, listOfRecipe: listOfRecipe, errorMessage: null);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}
