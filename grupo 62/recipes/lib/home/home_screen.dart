import 'package:flutter/material.dart';
import 'package:recipes/home/recipe_item/recipe_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            children: [
              RecipeItem(
                imageUrl:
                    'https://www.themealdb.com/images/media/meals/1548772327.jpg',
                name: 'Baked salmon',
              ),
              RecipeItem(
                imageUrl:
                    'https://www.themealdb.com/images/media/meals/uvuyxu1503067369.jpg',
                name: 'Cajun spiced',
              ),
              RecipeItem(
                imageUrl:
                    'https://www.themealdb.com/images/media/meals/1520084413.jpg',
                name: 'Escovitch Fish',
              ),
              RecipeItem(
                imageUrl:
                    'https://www.themealdb.com/images/media/meals/a15wsa1614349126.jpg',
                name: 'Fish fofos',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
