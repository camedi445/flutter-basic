import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/provider/controller_provider.dart';
import 'package:recipes/ui/recipe_list_by_category/recipe_item/recipe_item.dart';
import 'package:recipes/ui/widgets/empty_state.dart';
import 'package:recipes/ui/widgets/loading.dart';

class RecipeListByCategoryScreen extends ConsumerWidget {
  const RecipeListByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeListByCategoryState =
        ref.watch(recipeListByCategoryControllerProvider);
    ref.watch(favoriteRecipeListControllerProvider);
    final favoriteRecipeListController =
        ref.read(favoriteRecipeListControllerProvider.notifier);

    ref.listen(recipeListByCategoryControllerProvider, (previous, current) {
      if (current.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.errorMessage ?? '',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: recipeListByCategoryState.isLoading
            ? Loading()
            : recipeListByCategoryState.listOfRecipe.isEmpty
                ? EmptyState()
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                      children: List.generate(
                        recipeListByCategoryState.listOfRecipe.length,
                        (index) {
                          final currentRecipe =
                              recipeListByCategoryState.listOfRecipe[index];
                          final currentRecipeWithFavoriteInfo =
                              favoriteRecipeListController
                                  .getRecipeWithFavoriteStatus(currentRecipe);

                          return RecipeItem(
                            recipe: currentRecipeWithFavoriteInfo,
                            onDetailTap: () {
                              context.go(
                                  '/home/recipeDetail/${recipeListByCategoryState.listOfRecipe[index].id}');
                            },
                            onFavouriteTap: () {
                              favoriteRecipeListController
                                  .toggleFavoriteRecipe(currentRecipe);
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
