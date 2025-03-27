import 'package:flutter/material.dart';

class RecipeItemName extends StatelessWidget {
  final String name;
  const RecipeItemName({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 22.0,
          color: Color(0xFF2E3E5C),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
