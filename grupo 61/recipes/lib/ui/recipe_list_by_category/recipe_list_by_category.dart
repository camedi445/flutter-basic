import 'package:flutter/material.dart';
import 'package:recipes/data/service/recipe_service.dart';
import 'package:recipes/domain/model/recipe.dart';
import 'package:recipes/ui/recipe_list_by_category/recipe_item/recipe_item.dart';
import 'package:recipes/ui/widgets/empty_state.dart';
import 'package:recipes/ui/widgets/loading.dart';

class RecipeListByCategoryScreen extends StatefulWidget {
  const RecipeListByCategoryScreen({super.key});

  @override
  State<RecipeListByCategoryScreen> createState() =>
      _RecipeListByCategoryScreenState();
}

class _RecipeListByCategoryScreenState
    extends State<RecipeListByCategoryScreen> {
  List<Recipe> _recipeList = [];
  bool _isLoading = false;
  //String? _errorMessage;

  final RecipeService _recipeService = RecipeService();
  // TODO se debe crear el servicio en otra parte

  Future<void> _fetchRecipeListByCategory() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final recipeList =
          await _recipeService.fetchRecipeListByCategory('Chicken');
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        _recipeList = recipeList;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        );
      });
    }
  } // TODO debemos delegar el llamado al controlador

  @override
  void initState() {
    super.initState();
    _fetchRecipeListByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? Loading()
            : _recipeList.isEmpty
                ? EmptyState()
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.45,
                      children: List.generate(
                        _recipeList.length,
                        (index) {
                          return RecipeItem(
                            recipe: _recipeList[index],
                            onFavouriteTap: () {
                              setState(() {
                                _recipeList[index].isFavorite =
                                    !_recipeList[index].isFavorite;
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
