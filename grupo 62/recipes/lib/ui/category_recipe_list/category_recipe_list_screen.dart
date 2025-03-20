import 'package:flutter/material.dart';
import 'package:recipes/data/recipe_service.dart';
import 'package:recipes/domain/model/recipe.dart';
import 'package:recipes/ui/category_recipe_list/recipe_item/recipe_item.dart';

class CategoryRecipeListScreen extends StatefulWidget {
  const CategoryRecipeListScreen({super.key});

  @override
  State<CategoryRecipeListScreen> createState() => _CategoryRecipeListState();
}

class _CategoryRecipeListState extends State<CategoryRecipeListScreen> {
  final recipeService =
      RecipeService(); // TODO hay que delegar esa creacion a otro elemento
  List<Recipe> _recipeList = [];

  @override
  void initState() {
    // Esta logica se aplica cuando se crea el widget
    super.initState();
    _fetchRecipeListByCategory();
  }

  Future<void> _fetchRecipeListByCategory() async {
    final list = await recipeService.fetchRecipeListByCategory('SeaFood');
    setState(() {
      _recipeList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Esta logica se aplica antes del renderizado
    return Scaffold(
      body: _recipeList.isEmpty
          ? Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Text(
                  'Cargando',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.45,
                  children: List.generate(
                    _recipeList.length,
                    (index) {
                      return RecipeItem(
                        recipe: _recipeList[index],
                        onFavoriteTap: () {
                          setState(() {
                            //_favorites[index] = !_favorites[index]; // TODO organizar estados
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
