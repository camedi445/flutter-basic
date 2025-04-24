import 'package:recipes/domain/model/recipe.dart';

abstract class RecipeDatasource {
  Future<List<Recipe>> fetchRecipeListByCategory(String categoryName);
}
