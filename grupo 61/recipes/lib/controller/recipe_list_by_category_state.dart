import 'package:recipes/domain/model/recipe.dart';

class RecipeListByCategoryState {
  final bool isLoading;
  final List<Recipe> listOfRecipe;
  final String? errorMessage;

  RecipeListByCategoryState({
    this.isLoading = false,
    this.listOfRecipe = const [],
    this.errorMessage,
  });

  RecipeListByCategoryState copyWith({
    bool? isLoading,
    List<Recipe>? listOfRecipe,
    String? errorMessage,
  }) {
    return RecipeListByCategoryState(
      isLoading: isLoading ?? this.isLoading,
      listOfRecipe: listOfRecipe ?? this.listOfRecipe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
