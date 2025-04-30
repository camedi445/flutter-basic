import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/ui/category_recipe_list/provider/controller_provider.dart';
import 'package:recipes/ui/widgets/empty_state.dart';

class FavoriteRecipeListScreen extends ConsumerWidget {
  const FavoriteRecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipeList = ref.watch(favoriteRecipeListControllerProvider);
    final favoriteRecipeListController =
        ref.read(favoriteRecipeListControllerProvider.notifier);
    return Scaffold(
      body: favoriteRecipeList.isEmpty
          ? const EmptyState()
          : ListView.builder(
              itemCount: favoriteRecipeListController.favoriterListCount,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipeList[index];
                return Text(recipe.name);
              },
            ),
    );
  }
}
