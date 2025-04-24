import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/data/datasource/recipe_api_datasource.dart';
import 'package:recipes/data/repository/recipe_repository.dart';

final recipeApiRepositoryProvider = Provider<RecipeRepository>((ref) {
  final recipeApiDatasource = RecipeApiDatasource();
  final recipeApiRepository = RecipeRepository(recipeApiDatasource);
  return recipeApiRepository;
});
