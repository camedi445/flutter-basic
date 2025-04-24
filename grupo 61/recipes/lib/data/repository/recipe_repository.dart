import 'package:recipes/domain/datasource/recipe_datasource.dart';
import 'package:recipes/domain/model/recipe.dart';

class RecipeRepository {
  final RecipeDatasource recipeDatasource;

  RecipeRepository(this.recipeDatasource);

  Future<List<Recipe>> getRecipeListByCategory(String categoryName) {
    return recipeDatasource.fetchRecipeListByCategory(categoryName);
  }
}
