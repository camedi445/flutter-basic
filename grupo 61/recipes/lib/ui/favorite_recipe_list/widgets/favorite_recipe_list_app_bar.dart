import 'package:flutter/material.dart';
import 'package:recipes/ui/favorite_recipe_list/widgets/clear_favorite_list_alert_dialog.dart';

class FavoriteRecipeListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool isEmptyList;
  final VoidCallback onClearAllTapped;
  const FavoriteRecipeListAppBar({
    super.key,
    required this.title,
    required this.isEmptyList,
    required this.onClearAllTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        if (isEmptyList)
          IconButton(
            onPressed: () {
              // Confirmar si lo quiere eliminar todo o no?
              showDialog(
                context: context,
                builder: (context) => ClearFavoriteListAlertDialog(
                    onClearAllTapped: onClearAllTapped),
              );
            },
            icon: const Icon(
              Icons.delete_sweep,
              size: 24.0,
              color: Colors.grey,
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
