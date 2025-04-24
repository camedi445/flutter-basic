import 'package:recipes/domain/datasource/recipe_datasource.dart';
import 'package:recipes/domain/model/recipe.dart';

class RecipeSharedPreferenceDatasource extends RecipeDatasource {
  @override
  Future<List<Recipe>> fetchRecipeListByCategory(String categoryName) async {
    return [];
  }
}
