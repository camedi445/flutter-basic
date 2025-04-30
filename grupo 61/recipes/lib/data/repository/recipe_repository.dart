import 'package:recipes/domain/datasource/recipe_datasource.dart';
import 'package:recipes/domain/model/recipe.dart';

class RecipeRepository {
  final RecipeDatasource _recipeDatasource;

  RecipeRepository(this._recipeDatasource);

  Future<List<Recipe>> getRecipeListByCategory(String categoryName) {
    return _recipeDatasource.fetchRecipeListByCategory(categoryName);
  }
}
