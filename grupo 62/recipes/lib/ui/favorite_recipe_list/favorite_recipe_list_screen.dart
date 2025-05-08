import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/ui/category_recipe_list/provider/controller_provider.dart';
import 'package:recipes/ui/favorite_recipe_list/widgets/favorite_recipe_item.dart';
import 'package:recipes/ui/widgets/empty_state.dart';

class FavoriteRecipeListScreen extends ConsumerWidget {
  const FavoriteRecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipeList = ref.watch(favoriteRecipeListControllerProvider);
    final favoriteRecipeListController =
        ref.read(favoriteRecipeListControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Mis Favoritas (${favoriteRecipeListController.favoriterListCount})'),
        actions: [
          if (favoriteRecipeList.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Borrar favoritos'),
                    content: const Text(
                        '¿Estás seguro de que quieres eliminar todas tus recetas favoritas?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          favoriteRecipeListController.removeAll();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Todas las recetas han sido eliminadas'),
                            ),
                          );
                        },
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
                );
              },
            )
        ],
      ),
      body: favoriteRecipeList.isEmpty
          ? const EmptyState()
          : ListView.builder(
              itemCount: favoriteRecipeListController.favoriterListCount,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipeList[index];
                return Dismissible(
                  key: Key(recipe.id),
                  background: Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    color: Colors.red.shade100,
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ),
                  onDismissed: (_) {
                    favoriteRecipeListController.removeFromFavoriteList(recipe);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${recipe.name} eliminada de los favoritos'),
                      ),
                    );
                  },
                  child: FavoriteRecipeItem(
                    recipe: recipe,
                  ),
                );
              },
            ),
    );
  }
}
