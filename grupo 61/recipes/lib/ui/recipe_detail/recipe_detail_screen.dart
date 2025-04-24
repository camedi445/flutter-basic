import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String? id;
  const RecipeDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de la receta'),
      ),
      body: SafeArea(
        child: Center(
          child: Text(id ?? 'Id no encontrado'),
        ),
      ),
    );
  }
}
