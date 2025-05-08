import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/provider/controller_provider.dart';
import 'package:recipes/ui/favorite_recipe_list/widgets/favorite_recipe_item.dart';
import 'package:recipes/ui/favorite_recipe_list/widgets/favorite_recipe_list_app_bar.dart';
import 'package:recipes/ui/widgets/empty_state.dart';

class FavoriteRecipeListScreen extends ConsumerWidget {
  const FavoriteRecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipeList = ref.watch(favoriteRecipeListControllerProvider);
    final favoriteRecipeListController =
        ref.read(favoriteRecipeListControllerProvider.notifier);

    return Scaffold(
      appBar: FavoriteRecipeListAppBar(
        title: 'Mis favoritos (${favoriteRecipeList.length})',
        isEmptyList: favoriteRecipeList.isEmpty,
        onClearAllTapped: favoriteRecipeListController.clearAll,
      ),
      body: SafeArea(
        child: favoriteRecipeList.isEmpty
            ? const EmptyState()
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: favoriteRecipeList.length,
                itemBuilder: (context, index) {
                  final currentRecipe = favoriteRecipeList[index];
                  return Dismissible(
                    key: Key(currentRecipe.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      color: Colors.red.shade100,
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                    onDismissed: (_) {
                      favoriteRecipeListController
                          .removeFromFavoriteRecipeList(currentRecipe);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${currentRecipe.name} ha sido eliminada de los favoritos'),
                        ),
                      );
                    },
                    child: FavoriteRecipeItem(
                      recipe: currentRecipe,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
