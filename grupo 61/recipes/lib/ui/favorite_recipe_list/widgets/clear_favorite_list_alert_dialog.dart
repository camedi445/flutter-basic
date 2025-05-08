import 'package:flutter/material.dart';

class ClearFavoriteListAlertDialog extends StatelessWidget {
  final VoidCallback onClearAllTapped;

  const ClearFavoriteListAlertDialog({
    super.key,
    required this.onClearAllTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Limpiar favoritos'),
      content: const Text(
        '¿Estás seguro de que quieres eliminar todas tus recetas favoritas?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onClearAllTapped;
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(' Todos los favoritos han sido eliminados!'),
              behavior: SnackBarBehavior.floating,
            ));
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
