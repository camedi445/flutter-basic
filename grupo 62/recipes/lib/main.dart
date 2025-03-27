import 'package:flutter/material.dart';
import 'package:recipes/ui/home/home_screen.dart';
import 'package:recipes/ui/recipe_detail/recipe_detail_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/recipeDetail': (context) => const RecipeDetailScreen(id: 'id'),
        // TODO arreglar la navegacion
      },
    );
  }
}
