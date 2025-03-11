import 'package:flutter/material.dart';

class RecipeName extends StatelessWidget {
  final String name;
  const RecipeName({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w800,
          color: Color(0xFF2E3E5C),
        ),
      ),
    );
  }
}
