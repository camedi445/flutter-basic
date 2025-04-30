import 'package:recipes/domain/model/recipe.dart';

class CategoryRecipeListState {
  final bool isLoading;
  final List<Recipe> listOfRecipe;
  final String? errorMessage;

  CategoryRecipeListState({
    this.isLoading = false,
    this.listOfRecipe = const [],
    this.errorMessage,
  });

  CategoryRecipeListState copyWith(
      {bool? isLoading, List<Recipe>? listOfRecipe, String? errorMessage}) {
    return CategoryRecipeListState(
      isLoading: isLoading ?? this.isLoading,
      listOfRecipe: listOfRecipe ?? this.listOfRecipe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
