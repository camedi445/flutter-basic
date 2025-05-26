import 'dart:convert';

import 'package:recipes/domain/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<List<Recipe>> fetchRecipeListByCategory(String categoyName) async {
    final url = Uri.https('www.themealdb.com', '/api/json/v1/1/filter.php', {
      'c': categoyName,
    });
    await Future.delayed(Duration(seconds: 5));

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> listOfJson =
          jsonDecode(response.body)['meals'] as List;
      return listOfJson.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('No hay recetas para esa categoría');
    }
  }
}
