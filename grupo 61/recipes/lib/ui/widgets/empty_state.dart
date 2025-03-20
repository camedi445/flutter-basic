import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'No hay recetas para la categoría',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
