import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/model/recipe.dart';

class FavoriteRecipeListController extends StateNotifier<List<Recipe>> {
  FavoriteRecipeListController() : super([]);

  //Verificar si una receta ya está marcada como favorita
  bool isFavorite(String recipeId) {
    return state.any((favoriteRecipe) => favoriteRecipe.id == recipeId);
  }

  // Agregar una receta favorita
  void addToRecipeFavoriteList(Recipe recipe) {
    if (!state.any((favoriteRecipe) => favoriteRecipe.id == recipe.id)) {
      state = [...state, recipe.copyWith(isFavorite: true)];
    }
  }

  // Eliminar
  void removeFromFavoriteRecipeList(Recipe recipe) {
    state = state
        .where((favoriteRecipe) => favoriteRecipe.id != recipe.id)
        .toList();
  }

  // Alternar el estado de la receta en las lista de favoritos
  void toggleFavoriteRecipe(Recipe recipe) {
    if (isFavorite(recipe.id)) {
      removeFromFavoriteRecipeList(recipe);
    } else {
      addToRecipeFavoriteList(recipe);
    }
  }

  // Obtener una receta con su estado de favorito actualizado
  Recipe getRecipeWithFavoriteStatus(Recipe recipe) {
    return recipe.copyWith(isFavorite: isFavorite(recipe.id));
  }

  // Eliminar todas las recetas
  void clearAll() {
    state = [];
  }
}
