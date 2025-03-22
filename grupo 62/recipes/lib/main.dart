import 'package:flutter/material.dart';
import 'package:recipes/ui/category_recipe_list/category_recipe_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryRecipeListScreen(),
    );
  }
}
