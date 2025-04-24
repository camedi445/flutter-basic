import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/domain/model/recipe.dart';

class RecipeNotifier extends StateNotifier<List<Recipe>> {
  RecipeNotifier({listOfRecipe}) : super(listOfRecipe);
}
