import 'dart:convert';

import 'package:recipes/domain/datasource/recipe_datasource.dart';
import 'package:recipes/domain/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApiDatasource extends RecipeDatasource {
  @override
  Future<List<Recipe>> fetchRecipeListByCategory(String categoryName) async {
    final url = Uri.https(
      'www.themealdb.com',
      '/api/json/v1/1/filter.php',
      {'c': categoryName},
    );

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> listOfJson =
            jsonDecode(response.body)['meals'] as List;
        final recipeList =
            listOfJson.map((json) => Recipe.fromJson(json)).toList();
        return recipeList;
      } else {
        throw Exception('No existen recetas para la categor');
        // TODO capturar los errores no controlados
      }
    } catch (error) {
      throw Exception('Ocurrió un error procesando los datos del API');
    }
  }
}
