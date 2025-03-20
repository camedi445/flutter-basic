import 'package:flutter/material.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: [
          Text(
            'SeadFood',
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF9FA5C0),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' • ',
            style: TextStyle(
              fontSize: 24.0,
              color: Color(0xFF9FA5C0),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '>60',
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF9FA5C0),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
