import 'package:flutter/material.dart';
import 'package:recipes/ui/recipe_list_by_category/recipe_list_by_category.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeListByCategoryScreen(),
    );
  }
}
