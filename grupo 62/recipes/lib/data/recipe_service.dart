// Obtener los datos del api

// URL del endpoint

// dominio ->
// endpoint ->
// query param -> c = Seafood

// Estructura de la respuesta

/* {
      "strMeal": "Escovitch Fish",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/1520084413.jpg",
      "idMeal": "52944"
    } */

import 'dart:convert';

import 'package:recipes/domain/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<List<Recipe>> fetchRecipeListByCategory(String categoyName) async {
    var url = Uri.https('www.themealdb.com', '/api/json/v1/1/filter.php', {
      'c': categoyName,
    });
    await Future.delayed(Duration(seconds: 1));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> listOfJson =
          jsonDecode(response.body)['meals'] as List;
      return listOfJson.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('No hay recetas para esa categoría');
    }
  }
}
