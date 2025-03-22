import 'package:flutter/material.dart';
import 'package:recipes/data/recipe_service.dart';
import 'package:recipes/domain/model/recipe.dart';
import 'package:recipes/ui/category_recipe_list/recipe_item/recipe_item.dart';
import 'package:recipes/ui/recipe_detail/recipe_detail_screen.dart';
import 'package:recipes/ui/widgets/empty_state.dart';
import 'package:recipes/ui/widgets/loading.dart';

class CategoryRecipeListScreen extends StatefulWidget {
  const CategoryRecipeListScreen({super.key});

  @override
  State<CategoryRecipeListScreen> createState() => _CategoryRecipeListState();
}

class _CategoryRecipeListState extends State<CategoryRecipeListScreen> {
  final recipeService =
      RecipeService(); // TODO hay que delegar esa creacion a otro elemento
  List<Recipe> _recipeList = [];
  bool _isLoading = false;

  @override
  void initState() {
    // Esta logica se aplica cuando se crea el widget
    super.initState();
    _fetchRecipeListByCategory();
  }

  // TODO is delegar este codigo al controlador

  Future<void> _fetchRecipeListByCategory() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final list = await recipeService.fetchRecipeListByCategory('Chicken');
      setState(() {
        _recipeList = list;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.toString(),
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Esta logica se aplica antes del renderizado
    return Scaffold(
      body: _isLoading
          ? Loading()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: _recipeList.isEmpty
                    ? EmptyState()
                    : GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.4,
                        children: List.generate(
                          _recipeList.length,
                          (index) {
                            return RecipeItem(
                              recipe: _recipeList[index],
                              onFavoriteTap: () {
                                setState(() {
                                  _recipeList[index].isFavorite =
                                      !_recipeList[index].isFavorite;
                                });
                              },
                              onNameTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RecipeDetailScreen(),
                                  ),
                                );
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
