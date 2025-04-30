import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/ui/category_recipe_list/controller/category_recipe_list_state.dart';
import 'package:recipes/ui/category_recipe_list/provider/controller_provider.dart';
import 'package:recipes/ui/category_recipe_list/recipe_item/recipe_item.dart';
import 'package:recipes/ui/widgets/empty_state.dart';
import 'package:recipes/ui/widgets/loading.dart';

class CategoryRecipeListScreen extends ConsumerWidget {
  const CategoryRecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeState = ref.watch(categoryRecipeListControllerProvider);
    final favoriteRecipeListController =
        ref.read(favoriteRecipeListControllerProvider.notifier);

    ref.listen<CategoryRecipeListState>(categoryRecipeListControllerProvider,
        (previous, current) {
      if (current.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(current.errorMessage ?? "Ocurrio un error"),
          ),
        );
      }
    });

    return Scaffold(
      body: recipeState.isLoading
          ? Loading()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: recipeState.listOfRecipe.isEmpty
                    ? EmptyState()
                    : GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        children: List.generate(
                          recipeState.listOfRecipe.length,
                          (index) {
                            final currentRecipe =
                                recipeState.listOfRecipe[index];
                            final bool currentRecipeIsFavorite =
                                favoriteRecipeListController
                                    .isFavorite(currentRecipe.id);
                            return RecipeItem(
                              recipe: currentRecipe.copyWith(
                                  isFavorite: currentRecipeIsFavorite),
                              onFavoriteTap: () {
                                favoriteRecipeListController
                                    .toggleFavorite(currentRecipe);
                              },
                              onDetailTap: () {
                                context.go(
                                    '/home/recipeDetail/${currentRecipe.id}');
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
