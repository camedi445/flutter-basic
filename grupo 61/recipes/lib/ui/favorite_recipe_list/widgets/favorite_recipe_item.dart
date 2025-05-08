import 'package:flutter/material.dart';
import 'package:recipes/domain/model/recipe.dart';

class FavoriteRecipeItem extends StatelessWidget {
  final Recipe recipe;

  const FavoriteRecipeItem({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: Row(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(recipe.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        size: 16.0,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text('${60} min'),
                      SizedBox(
                        width: 16.0,
                      ),
                      const Icon(
                        Icons.people_outline,
                        size: 16.0,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text('${7} porciones'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
