import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/model/recipe.dart';

class FavoriteRecipeListController extends StateNotifier<List<Recipe>> {
  FavoriteRecipeListController() : super([]);

  // Agregar una receta a la lista de favoritos
  void addToFavoriteList(Recipe targetRecipe) {
    if (!state.any((recipe) => recipe.id == targetRecipe.id)) {
      state = [...state, targetRecipe.copyWith(isFavorite: true)];
    }
  }

  // Eliminar una receta de favoritos
  void removeFromFavoriteList(Recipe targetRecipe) {
    state = state.where((recipe) => recipe.id != targetRecipe.id).toList();
  }

  // Verificar si una receta está marcada como favorita
  bool isFavorite(String recipeId) {
    return state.any((recipe) => recipe.id == recipeId);
  }

  // Alternar el estado de una receta favorita
  void toggleFavorite(Recipe recipe) {
    if (isFavorite(recipe.id)) {
      removeFromFavoriteList(recipe);
    } else {
      addToFavoriteList(recipe);
    }
  }

  // Obtener el total de favoritos
  int get favoriterListCount => state.length;

  // Eliminar todas las recetas favoritas
  void removeAll() {
    state = [];
  }

  // Obtener todas las recetas favoritas
  List<Recipe> get allFavoriteRecipes => state;
}
